; ModuleID = 'test_malloc.c'
source_filename = "test_malloc.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.14.0"

%struct.Person = type { i32, i32 }

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !15 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.Person*, align 8
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata %struct.Person** %2, metadata !18, metadata !19), !dbg !20
  %3 = call i8* @malloc(i64 8) #3, !dbg !21
  %4 = bitcast i8* %3 to %struct.Person*, !dbg !22
  store %struct.Person* %4, %struct.Person** %2, align 8, !dbg !20
  %5 = load %struct.Person*, %struct.Person** %2, align 8, !dbg !23
  %6 = getelementptr inbounds %struct.Person, %struct.Person* %5, i32 0, i32 0, !dbg !24
  store i32 10, i32* %6, align 4, !dbg !25
  %7 = load %struct.Person*, %struct.Person** %2, align 8, !dbg !26
  %8 = getelementptr inbounds %struct.Person, %struct.Person* %7, i32 0, i32 1, !dbg !27
  store i32 10, i32* %8, align 4, !dbg !28
  ret i32 0, !dbg !29
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { allocsize(0) "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { allocsize(0) }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 5.0.2 (tags/RELEASE_502/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "test_malloc.c", directory: "/Users/yongzhehuang/Documents/pdg-projects/llvm_playground/test")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Person", file: !1, line: 4, size: 64, elements: !6)
!6 = !{!7, !9}
!7 = !DIDerivedType(tag: DW_TAG_member, name: "age", scope: !5, file: !1, line: 5, baseType: !8, size: 32)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_member, name: "height", scope: !5, file: !1, line: 6, baseType: !8, size: 32, offset: 32)
!10 = !{i32 2, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"PIC Level", i32 2}
!14 = !{!"clang version 5.0.2 (tags/RELEASE_502/final)"}
!15 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 10, type: !16, isLocal: false, isDefinition: true, scopeLine: 10, isOptimized: false, unit: !0, variables: !2)
!16 = !DISubroutineType(types: !17)
!17 = !{!8}
!18 = !DILocalVariable(name: "p", scope: !15, file: !1, line: 11, type: !4)
!19 = !DIExpression()
!20 = !DILocation(line: 11, column: 20, scope: !15)
!21 = !DILocation(line: 11, column: 40, scope: !15)
!22 = !DILocation(line: 11, column: 24, scope: !15)
!23 = !DILocation(line: 12, column: 5, scope: !15)
!24 = !DILocation(line: 12, column: 8, scope: !15)
!25 = !DILocation(line: 12, column: 12, scope: !15)
!26 = !DILocation(line: 13, column: 5, scope: !15)
!27 = !DILocation(line: 13, column: 8, scope: !15)
!28 = !DILocation(line: 13, column: 15, scope: !15)
!29 = !DILocation(line: 14, column: 5, scope: !15)
