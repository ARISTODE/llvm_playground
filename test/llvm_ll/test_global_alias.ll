; ModuleID = 'test_global_alias.c'
source_filename = "test_global_alias.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.14.0"

%struct.Person = type { i32 }

@b = global i32 10, align 4, !dbg !0
@a = global i32* @b, align 8, !dbg !6
@main.p = private unnamed_addr constant %struct.Person { i32 10 }, align 4

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @f(%struct.Person*) #0 !dbg !15 {
  %2 = alloca %struct.Person*, align 8
  store %struct.Person* %0, %struct.Person** %2, align 8
  call void @llvm.dbg.declare(metadata %struct.Person** %2, metadata !23, metadata !24), !dbg !25
  %3 = load i32*, i32** @a, align 8, !dbg !26
  %4 = load i32, i32* %3, align 4, !dbg !27
  %5 = load %struct.Person*, %struct.Person** %2, align 8, !dbg !28
  %6 = getelementptr inbounds %struct.Person, %struct.Person* %5, i32 0, i32 0, !dbg !29
  store i32 %4, i32* %6, align 4, !dbg !30
  %7 = load %struct.Person*, %struct.Person** %2, align 8, !dbg !31
  %8 = getelementptr inbounds %struct.Person, %struct.Person* %7, i32 0, i32 0, !dbg !32
  %9 = load i32, i32* %8, align 4, !dbg !32
  ret i32 %9, !dbg !33
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !34 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.Person, align 4
  %3 = alloca %struct.Person*, align 8
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata %struct.Person* %2, metadata !37, metadata !24), !dbg !38
  %4 = bitcast %struct.Person* %2 to i8*, !dbg !38
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* bitcast (%struct.Person* @main.p to i8*), i64 4, i32 4, i1 false), !dbg !38
  call void @llvm.dbg.declare(metadata %struct.Person** %3, metadata !39, metadata !24), !dbg !40
  store %struct.Person* %2, %struct.Person** %3, align 8, !dbg !40
  %5 = load %struct.Person*, %struct.Person** %3, align 8, !dbg !41
  %6 = call i32 @f(%struct.Person* %5), !dbg !42
  ret i32 0, !dbg !43
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { argmemonly nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = !DIGlobalVariableExpression(var: !1)
!1 = distinct !DIGlobalVariable(name: "b", scope: !2, file: !3, line: 5, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 5.0.2 (tags/RELEASE_502/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5)
!3 = !DIFile(filename: "test_global_alias.c", directory: "/Users/yongzhehuang/Documents/pdg-projects/llvm_playground/test")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7)
!7 = distinct !DIGlobalVariable(name: "a", scope: !2, file: !3, line: 6, type: !8, isLocal: false, isDefinition: true)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 2, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"PIC Level", i32 2}
!14 = !{!"clang version 5.0.2 (tags/RELEASE_502/final)"}
!15 = distinct !DISubprogram(name: "f", scope: !3, file: !3, line: 8, type: !16, isLocal: false, isDefinition: true, scopeLine: 8, flags: DIFlagPrototyped, isOptimized: false, unit: !2, variables: !4)
!16 = !DISubroutineType(types: !17)
!17 = !{!9, !18}
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "person_t", file: !3, line: 4, baseType: !20)
!20 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Person", file: !3, line: 2, size: 32, elements: !21)
!21 = !{!22}
!22 = !DIDerivedType(tag: DW_TAG_member, name: "age", scope: !20, file: !3, line: 3, baseType: !9, size: 32)
!23 = !DILocalVariable(name: "p", arg: 1, scope: !15, file: !3, line: 8, type: !18)
!24 = !DIExpression()
!25 = !DILocation(line: 8, column: 17, scope: !15)
!26 = !DILocation(line: 9, column: 15, scope: !15)
!27 = !DILocation(line: 9, column: 14, scope: !15)
!28 = !DILocation(line: 9, column: 5, scope: !15)
!29 = !DILocation(line: 9, column: 8, scope: !15)
!30 = !DILocation(line: 9, column: 12, scope: !15)
!31 = !DILocation(line: 10, column: 12, scope: !15)
!32 = !DILocation(line: 10, column: 15, scope: !15)
!33 = !DILocation(line: 10, column: 5, scope: !15)
!34 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 13, type: !35, isLocal: false, isDefinition: true, scopeLine: 13, isOptimized: false, unit: !2, variables: !4)
!35 = !DISubroutineType(types: !36)
!36 = !{!9}
!37 = !DILocalVariable(name: "p", scope: !34, file: !3, line: 14, type: !19)
!38 = !DILocation(line: 14, column: 14, scope: !34)
!39 = !DILocalVariable(name: "pt", scope: !34, file: !3, line: 15, type: !18)
!40 = !DILocation(line: 15, column: 15, scope: !34)
!41 = !DILocation(line: 16, column: 7, scope: !34)
!42 = !DILocation(line: 16, column: 5, scope: !34)
!43 = !DILocation(line: 17, column: 5, scope: !34)
