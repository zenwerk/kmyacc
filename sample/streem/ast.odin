package main

import "core:fmt"
import "core:strings"

// ============================================================================
// AST Node Definitions
// ============================================================================

Node_Type :: enum {
	// Literals
	Int,
	Float,
	Time,
	Str,
	Nil,
	Bool,
	// Collections
	Args,
	Pair,
	Array,
	Nodes,
	// Splat
	Splat,
	// Expressions
	Ident,
	Op,
	If,
	Lambda,
	Call,
	Fcall,
	Genfunc,
	// Statements
	Let,
	Emit,
	Skip,
	Return,
	// Top-level
	Ns,
	Import,
	// Pattern matching
	PArray,
	PStruct,
	PSplat,
	PLambda,
}

Node :: struct {
	type: Node_Type,
	data: Node_Data,
}

Node_Data :: union {
	Node_Int,
	Node_Float,
	Node_Time,
	Node_Str,
	Node_Bool,
	Node_Args,
	Node_Pair,
	Node_Array,
	Node_Nodes,
	Node_Splat,
	Node_Ident,
	Node_Op,
	Node_If,
	Node_Lambda,
	Node_Call,
	Node_Fcall,
	Node_Genfunc,
	Node_Let,
	Node_Emit,
	Node_Return,
	Node_Ns,
	Node_Import,
	Node_PArray,
	Node_PStruct,
	Node_PSplat,
	Node_PLambda,
	Node_Skip,
}

Node_Int :: struct {
	value: i64,
}

Node_Float :: struct {
	value: f64,
}

Node_Time :: struct {
	raw: string,
}

Node_Str :: struct {
	value: string,
}

Node_Bool :: struct {
	value: bool,
}

Node_Args :: struct {
	names: [dynamic]string,
}

Node_Pair :: struct {
	key:   string,
	value: ^Node,
}

Node_Array :: struct {
	elements: [dynamic]^Node,
}

Node_Nodes :: struct {
	nodes: [dynamic]^Node,
}

Node_Splat :: struct {
	expr: ^Node,
}

Node_Ident :: struct {
	name: string,
}

Node_Op :: struct {
	op:  string,
	lhs: ^Node,
	rhs: ^Node,
}

Node_If :: struct {
	cond:     ^Node,
	then_:    ^Node,
	opt_else: ^Node,
}

Node_Lambda :: struct {
	args:     ^Node, // Node_Args or nil
	body:     ^Node,
	is_block: bool,
}

Node_Call :: struct {
	name: string,
	args: ^Node, // Node_Array or nil
}

Node_Fcall :: struct {
	func_: ^Node,
	args:  ^Node, // Node_Array or nil
}

Node_Genfunc :: struct {
	name: string,
}

Node_Let :: struct {
	lhs: string,
	rhs: ^Node,
}

Node_Emit :: struct {
	value: ^Node,
}

Node_Return :: struct {
	value: ^Node,
}

Node_Ns :: struct {
	name: string,
	body: ^Node,
}

Node_Import :: struct {
	name: string,
}

Node_PArray :: struct {
	patterns: [dynamic]^Node,
}

Node_PStruct :: struct {
	patterns: [dynamic]^Node,
}

Node_PSplat :: struct {
	head: ^Node,
	mid:  ^Node,
	tail: ^Node,
}

Node_PLambda :: struct {
	pat:   ^Node,
	cond:  ^Node,
	body:  ^Node,
	next_: ^Node,
}

// ============================================================================
// Node Constructors
// ============================================================================

node_new :: proc(type: Node_Type, data: Node_Data) -> ^Node {
	n := new(Node)
	n.type = type
	n.data = data
	return n
}

node_int_new :: proc(value: i64) -> ^Node {
	return node_new(.Int, Node_Int{value = value})
}

node_float_new :: proc(value: f64) -> ^Node {
	return node_new(.Float, Node_Float{value = value})
}

node_str_new :: proc(value: string) -> ^Node {
	return node_new(.Str, Node_Str{value = value})
}

node_bool_new :: proc(value: bool) -> ^Node {
	return node_new(.Bool, Node_Bool{value = value})
}

node_nil_new :: proc() -> ^Node {
	return node_new(.Nil, nil)
}

node_ident_new :: proc(name: string) -> ^Node {
	return node_new(.Ident, Node_Ident{name = name})
}

node_op_new :: proc(op: string, lhs: ^Node, rhs: ^Node) -> ^Node {
	return node_new(.Op, Node_Op{op = op, lhs = lhs, rhs = rhs})
}

node_if_new :: proc(cond: ^Node, then_: ^Node, opt_else: ^Node) -> ^Node {
	return node_new(.If, Node_If{cond = cond, then_ = then_, opt_else = opt_else})
}

node_lambda_new :: proc(args: ^Node, body: ^Node) -> ^Node {
	return node_new(.Lambda, Node_Lambda{args = args, body = body, is_block = false})
}

node_block_new :: proc(body: ^Node) -> ^Node {
	return node_new(.Lambda, Node_Lambda{args = nil, body = body, is_block = true})
}

node_call_new :: proc(name: string, args: ^Node) -> ^Node {
	return node_new(.Call, Node_Call{name = name, args = args})
}

node_fcall_new :: proc(func_: ^Node, args: ^Node) -> ^Node {
	return node_new(.Fcall, Node_Fcall{func_ = func_, args = args})
}

node_genfunc_new :: proc(name: string) -> ^Node {
	return node_new(.Genfunc, Node_Genfunc{name = name})
}

node_let_new :: proc(lhs: string, rhs: ^Node) -> ^Node {
	return node_new(.Let, Node_Let{lhs = lhs, rhs = rhs})
}

node_emit_new :: proc(value: ^Node) -> ^Node {
	return node_new(.Emit, Node_Emit{value = value})
}

node_return_new :: proc(value: ^Node) -> ^Node {
	return node_new(.Return, Node_Return{value = value})
}

node_skip_new :: proc() -> ^Node {
	return node_new(.Skip, Node_Skip{})
}

node_ns_new :: proc(name: string, body: ^Node) -> ^Node {
	return node_new(.Ns, Node_Ns{name = name, body = body})
}

node_import_new :: proc(name: string) -> ^Node {
	return node_new(.Import, Node_Import{name = name})
}

node_splat_new :: proc(expr: ^Node) -> ^Node {
	return node_new(.Splat, Node_Splat{expr = expr})
}

node_time_new :: proc(raw: string) -> ^Node {
	return node_new(.Time, Node_Time{raw = raw})
}

// ---- Collection constructors ----

node_array_new :: proc() -> ^Node {
	return node_new(.Array, Node_Array{})
}

node_array_add :: proc(arr: ^Node, elem: ^Node) {
	if arr == nil || arr.type != .Array { return }
	a := &arr.data.(Node_Array)
	append(&a.elements, elem)
}

node_nodes_new :: proc() -> ^Node {
	return node_new(.Nodes, Node_Nodes{})
}

node_nodes_add :: proc(nodes: ^Node, node: ^Node) {
	if nodes == nil || nodes.type != .Nodes { return }
	ns := &nodes.data.(Node_Nodes)
	append(&ns.nodes, node)
}

node_args_new :: proc() -> ^Node {
	return node_new(.Args, Node_Args{})
}

node_args_add :: proc(args: ^Node, name: string) {
	if args == nil || args.type != .Args { return }
	a := &args.data.(Node_Args)
	append(&a.names, name)
}

node_pair_new :: proc(key: string, value: ^Node) -> ^Node {
	return node_new(.Pair, Node_Pair{key = key, value = value})
}

// ---- Pattern constructors ----

node_parray_new :: proc() -> ^Node {
	return node_new(.PArray, Node_PArray{})
}

node_parray_add :: proc(parray: ^Node, pattern: ^Node) {
	if parray == nil || parray.type != .PArray { return }
	p := &parray.data.(Node_PArray)
	append(&p.patterns, pattern)
}

node_pstruct_new :: proc() -> ^Node {
	return node_new(.PStruct, Node_PStruct{})
}

node_pstruct_add :: proc(pstruct: ^Node, pattern: ^Node) {
	if pstruct == nil || pstruct.type != .PStruct { return }
	p := &pstruct.data.(Node_PStruct)
	append(&p.patterns, pattern)
}

node_plambda_new :: proc(pat: ^Node, cond: ^Node) -> ^Node {
	return node_new(.PLambda, Node_PLambda{pat = pat, cond = cond})
}

node_psplat_new :: proc(head: ^Node, mid: ^Node, tail: ^Node) -> ^Node {
	return node_new(.PSplat, Node_PSplat{head = head, mid = mid, tail = tail})
}

// ---- Helper functions ----

node_get_name :: proc(n: ^Node) -> string {
	if n == nil { return "" }
	#partial switch d in n.data {
	case Node_Ident: return d.name
	case Node_Str:   return d.value
	}
	return ""
}

node_plambda_body :: proc(plambda: ^Node, body: ^Node) -> ^Node {
	if plambda == nil || plambda.type != .PLambda { return plambda }
	p := &plambda.data.(Node_PLambda)
	p.body = body
	return plambda
}

node_plambda_add :: proc(head: ^Node, next: ^Node) -> ^Node {
	if head == nil { return next }
	if head.type != .PLambda { return head }
	// Find end of chain
	cur := head
	for {
		p := &cur.data.(Node_PLambda)
		if p.next_ == nil {
			p.next_ = next
			break
		}
		cur = p.next_
	}
	return head
}

// ============================================================================
// Node free
// ============================================================================

node_free :: proc(n: ^Node) {
	if n == nil { return }

	switch &d in n.data {
	case Node_Int, Node_Float, Node_Time, Node_Str, Node_Bool:
		// primitives - no extra free needed

	case Node_Args:
		delete(d.names)

	case Node_Pair:
		node_free(d.value)

	case Node_Array:
		for elem in d.elements { node_free(elem) }
		delete(d.elements)

	case Node_Nodes:
		for node in d.nodes { node_free(node) }
		delete(d.nodes)

	case Node_PArray:
		for pat in d.patterns { node_free(pat) }
		delete(d.patterns)

	case Node_PStruct:
		for pat in d.patterns { node_free(pat) }
		delete(d.patterns)

	case Node_Splat:
		node_free(d.expr)

	case Node_Ident:

	case Node_Op:
		node_free(d.lhs)
		node_free(d.rhs)

	case Node_If:
		node_free(d.cond)
		node_free(d.then_)
		node_free(d.opt_else)

	case Node_Lambda:
		node_free(d.args)
		node_free(d.body)

	case Node_Call:
		node_free(d.args)

	case Node_Fcall:
		node_free(d.func_)
		node_free(d.args)

	case Node_Genfunc:

	case Node_Let:
		node_free(d.rhs)

	case Node_Emit:
		node_free(d.value)

	case Node_Return:
		node_free(d.value)

	case Node_Ns:
		node_free(d.body)

	case Node_Import:

	case Node_PSplat:
		node_free(d.head)
		node_free(d.mid)
		node_free(d.tail)

	case Node_PLambda:
		node_free(d.pat)
		node_free(d.cond)
		node_free(d.body)
		node_free(d.next_)

	case Node_Skip:
		// no extra free needed
	}

	free(n)
}

// ============================================================================
// AST Printer
// ============================================================================

@(private="file")
print_indent :: proc(indent: int) {
	for _ in 0..<indent {
		fmt.printf("  ")
	}
}

print_ast :: proc(n: ^Node, indent: int) {
	if n == nil {
		print_indent(indent)
		fmt.println("<nil>")
		return
	}

	switch d in n.data {
	case Node_Int:
		print_indent(indent)
		fmt.printf("Int(%d)\n", d.value)

	case Node_Float:
		print_indent(indent)
		fmt.printf("Float(%f)\n", d.value)

	case Node_Time:
		print_indent(indent)
		fmt.printf("Time(%s)\n", d.raw)

	case Node_Str:
		print_indent(indent)
		fmt.printf("Str(\"%s\")\n", d.value)

	case Node_Bool:
		print_indent(indent)
		fmt.printf("Bool(%v)\n", d.value)

	case Node_Ident:
		print_indent(indent)
		fmt.printf("Ident(%s)\n", d.name)

	case Node_Op:
		print_indent(indent)
		fmt.printf("Op(%s)\n", d.op)
		print_ast(d.lhs, indent + 1)
		print_ast(d.rhs, indent + 1)

	case Node_If:
		print_indent(indent)
		fmt.println("If")
		print_indent(indent + 1)
		fmt.println("cond:")
		print_ast(d.cond, indent + 2)
		print_indent(indent + 1)
		fmt.println("then:")
		print_ast(d.then_, indent + 2)
		if d.opt_else != nil {
			print_indent(indent + 1)
			fmt.println("else:")
			print_ast(d.opt_else, indent + 2)
		}

	case Node_Lambda:
		print_indent(indent)
		if d.is_block {
			fmt.println("Block")
		} else {
			fmt.println("Lambda")
		}
		if d.args != nil {
			print_indent(indent + 1)
			fmt.println("args:")
			print_ast(d.args, indent + 2)
		}
		if d.body != nil {
			print_indent(indent + 1)
			fmt.println("body:")
			print_ast(d.body, indent + 2)
		}

	case Node_Call:
		print_indent(indent)
		fmt.printf("Call(%s)\n", d.name)
		if d.args != nil {
			print_ast(d.args, indent + 1)
		}

	case Node_Fcall:
		print_indent(indent)
		fmt.println("Fcall")
		print_indent(indent + 1)
		fmt.println("func:")
		print_ast(d.func_, indent + 2)
		if d.args != nil {
			print_indent(indent + 1)
			fmt.println("args:")
			print_ast(d.args, indent + 2)
		}

	case Node_Genfunc:
		print_indent(indent)
		fmt.printf("Genfunc(%s)\n", d.name)

	case Node_Let:
		print_indent(indent)
		fmt.printf("Let(%s)\n", d.lhs)
		print_ast(d.rhs, indent + 1)

	case Node_Emit:
		print_indent(indent)
		fmt.println("Emit")
		print_ast(d.value, indent + 1)

	case Node_Return:
		print_indent(indent)
		fmt.println("Return")
		print_ast(d.value, indent + 1)

	case Node_Skip:
		print_indent(indent)
		fmt.println("Skip")

	case Node_Ns:
		print_indent(indent)
		fmt.printf("Namespace(%s)\n", d.name)
		if d.body != nil {
			print_ast(d.body, indent + 1)
		}

	case Node_Import:
		print_indent(indent)
		fmt.printf("Import(%s)\n", d.name)

	case Node_Args:
		print_indent(indent)
		fmt.printf("Args(")
		for name, i in d.names {
			if i > 0 { fmt.printf(", ") }
			fmt.printf("%s", name)
		}
		fmt.println(")")

	case Node_Pair:
		print_indent(indent)
		fmt.printf("Pair(%s)\n", d.key)
		print_ast(d.value, indent + 1)

	case Node_Array:
		print_indent(indent)
		fmt.printf("Array[%d]\n", len(d.elements))
		for elem in d.elements {
			print_ast(elem, indent + 1)
		}

	case Node_Nodes:
		print_indent(indent)
		fmt.printf("Nodes[%d]\n", len(d.nodes))
		for node in d.nodes {
			print_ast(node, indent + 1)
		}

	case Node_Splat:
		print_indent(indent)
		fmt.println("Splat")
		print_ast(d.expr, indent + 1)

	case Node_PArray:
		print_indent(indent)
		fmt.printf("PArray[%d]\n", len(d.patterns))
		for pat in d.patterns {
			print_ast(pat, indent + 1)
		}

	case Node_PStruct:
		print_indent(indent)
		fmt.printf("PStruct[%d]\n", len(d.patterns))
		for pat in d.patterns {
			print_ast(pat, indent + 1)
		}

	case Node_PSplat:
		print_indent(indent)
		fmt.println("PSplat")
		if d.head != nil {
			print_indent(indent + 1)
			fmt.println("head:")
			print_ast(d.head, indent + 2)
		}
		if d.mid != nil {
			print_indent(indent + 1)
			fmt.println("mid:")
			print_ast(d.mid, indent + 2)
		}
		if d.tail != nil {
			print_indent(indent + 1)
			fmt.println("tail:")
			print_ast(d.tail, indent + 2)
		}

	case Node_PLambda:
		print_indent(indent)
		fmt.println("PLambda")
		if d.pat != nil {
			print_indent(indent + 1)
			fmt.println("pattern:")
			print_ast(d.pat, indent + 2)
		}
		if d.cond != nil {
			print_indent(indent + 1)
			fmt.println("guard:")
			print_ast(d.cond, indent + 2)
		}
		if d.body != nil {
			print_indent(indent + 1)
			fmt.println("body:")
			print_ast(d.body, indent + 2)
		}
		if d.next_ != nil {
			print_indent(indent + 1)
			fmt.println("next:")
			print_ast(d.next_, indent + 1)
		}

	case:
		print_indent(indent)
		fmt.printf("<%v>\n", n.type)
	}
}

// Node_Skip is a zero-size marker type used for skip statements.
Node_Skip :: struct {}
