<Program> -> <StmtList>
<StmtList> -> <StatementLine> <StmtList>
<StmtList> -> ɛ
<StatementLine> -> <StmtNo> <Statement> <EOL>
<Statement> -> <Formula>
<Statement> -> <Do>
<Statement> -> <Goto>
<Statement> -> <IfHead>
<Statement> -> <SenseLight>
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
<FPTermAtom> -> FXINUM
<FLPExpr> -> FLOAT
<EOL> -> #
<StmtNo> -> NUM
<FPV> -> I
<FPV> -> J
<FPV> -> K
<FPV> -> L
<FLPV> -> A
<FLPV> -> B
<FLPV> -> C
<FLPV> -> D
<Var> -> <FPV>
<Var> -> <FLPV>
<VDESG> -> <FPV>
<VDESG> -> NUM
<LIGHT> -> 1
<LIGHT> -> 2
<LIGHT> -> 3
<LIGHT> -> 4
<SWITCH> -> 1
<SWITCH> -> 2
<SWITCH> -> 3
<SWITCH> -> 4
<SWITCH> -> 5
<SWITCH> -> 6
