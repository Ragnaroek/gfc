<Program> -> <StmtList>
<StmtList> -> <StatementLine> <StmtList>
<StmtList> -> ɛ
<StatementLine> -> <StmtNo> <Statement> <EOL>
<Statement> -> <Formula>
<Statement> -> <Do>
<Statement> -> <Goto>
<Statement> -> <IfHead>
<Statement> -> <SenseLight>
<Statement> -> CONTINUE
<Formula> -> <Var> = <Expression>
<Do> -> DO <StmtNo> <FPV> = <DoStart> , <DoEnd> <DoIncrement>
<DoStart> -> <FPV>
<DoEnd> -> <FPV>
<DoIncrement> -> ɛ
<DoIncrement> -> , <VDESG>
<Goto> -> GO TO <StmtNo>
<IfHead> -> IF ( <IfTail>
<IfTail> -> <If>
<If> -> <Var> ) <IfNegJmp> , <IfZeroJmp> , <IfPosJmp>
<IfNegJmp> -> <StmtNo>
<IfZeroJmp> -> <StmtNo>
<IfPosJmp> -> <StmtNo>
<SenseLight> -> SENSE LIGHT <LIGHT>
<LightPlace> -> 0
<LightPlace> -> <LIGHT>
<IfTail> -> <IfSense>
<IfSense> -> <IfSenseLight>
<IfSense> -> <IfSenseSwitch>
<IfSenseLight> -> LIGHT <LIGHT> ) <LightOnJmp> , <LightOffJmp>
<LightOnJmp> -> <StmtNo>
<LightOffJmp> -> <StmtNo>
<IfSenseSwitch> -> SWITCH <SWITCH> ) <SwitchDownJmp> , <SwitchUpJmp>
<SwitchDownJmp> -> <StmtNo>
<SwitchUpJmp> -> <StmtNo>
<Expression> -> <FPExpr>
<Expression> -> <FLPExpr>
<FPExpr> -> <FPT> <FPE>
<FPE> -> + <FPT> <FPE>
<FPE> -> - <FPT> <FPE>
<FPE> -> ɛ
<FPT> -> <FPX> <FPT'>
<FPT'> -> * <FPX> <FPT'>
<FPT'> -> / <FPX> <FPT'>
<FPT'> -> ɛ
<FPX> -> <FPTerm> <FPX'>
<FPX'> -> ** <FPTermAtom> <FPX'>
<FPX'> -> ɛ
<FPTerm> -> ( <FPExpr> )
<FPTerm> -> <FPTermAtom>
<FPTermAtom> -> <FPV>
<FPTermAtom> -> FIXNUM
<FPTermAtom> -> FUNCTION_NAME ( <FPExpr> )
<FLPExpr> -> FLOAT
<EOL> -> #
<StmtNo> -> FIXNUM
<FPV> -> FIXED_POINT_VARIABLE
<FLPV> -> FLOATING_POINT_VARIABLE
<Var> -> <FPV>
<Var> -> <FLPV>
<VDESG> -> <FPV>
<VDESG> -> FIXNUM
<LIGHT> -> FIXNUM
<SWITCH> -> FIXNUM
