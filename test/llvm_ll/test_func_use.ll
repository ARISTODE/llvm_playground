; ModuleID = 'test_func_use.c'
source_filename = "test_func_use.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.14.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @f(i32) #0 !dbg !8 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !12, metadata !13), !dbg !14
  %3 = load i32, i32* %2, align 4, !dbg !15
  ret i32 %3, !dbg !16
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !17 {
  %1 = alloca i32, align 4
  %2 = alloca i32 (i32)*, align 8
  store i32 0, i32* %1, align 4
  %3 = call i32 @f(i32 5), !dbg !20
  call void @llvm.dbg.declare(metadata i32 (i32)** %2, metadata !21, metadata !13), !dbg !23
  store i32 (i32)* @f, i32 (i32)** %2, align 8, !dbg !23
  %4 = load i32 (i32)*, i32 (i32)** %2, align 8, !dbg !24
  %5 = call i32 %4(i32 8), !dbg !25
  ret i32 0, !dbg !26
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 5.0.2 (tags/RELEASE_502/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "test_func_use.c", directory: "/Users/yongzhehuang/Documents/pdg-projects/llvm_playground/test")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"PIC Level", i32 2}
!7 = !{!"clang version 5.0.2 (tags/RELEASE_502/final)"}
!8 = distinct !DISubprogram(name: "f", scope: !1, file: !1, line: 3, type: !9, isLocal: false, isDefinition: true, scopeLine: 3, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!9 = !DISubroutineType(types: !10)
!10 = !{!11, !11}
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DILocalVariable(name: "a", arg: 1, scope: !8, file: !1, line: 3, type: !11)
!13 = !DIExpression()
!14 = !DILocation(line: 3, column: 12, scope: !8)
!15 = !DILocation(line: 4, column: 12, scope: !8)
!16 = !DILocation(line: 4, column: 5, scope: !8)
!17 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 7, type: !18, isLocal: false, isDefinition: true, scopeLine: 7, isOptimized: false, unit: !0, variables: !2)
!18 = !DISubroutineType(types: !19)
!19 = !{!11}
!20 = !DILocation(line: 8, column: 5, scope: !17)
!21 = !DILocalVariable(name: "ff", scope: !17, file: !1, line: 9, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!23 = !DILocation(line: 9, column: 11, scope: !17)
!24 = !DILocation(line: 10, column: 7, scope: !17)
!25 = !DILocation(line: 10, column: 5, scope: !17)
!26 = !DILocation(line: 11, column: 5, scope: !17)
