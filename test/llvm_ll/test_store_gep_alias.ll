; ModuleID = 'test_store_gep_alias.c'
source_filename = "test_store_gep_alias.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.14.0"

%struct.Person = type { i32, [10 x i8] }

@.str = private unnamed_addr constant [9 x i8] c"New_name\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@main.p = private unnamed_addr constant %struct.Person { i32 15, [10 x i8] c"Jack\00\00\00\00\00\00" }, align 4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @func(%struct.Person*) #0 !dbg !8 {
  %2 = alloca %struct.Person*, align 8
  %3 = alloca i8*, align 8
  store %struct.Person* %0, %struct.Person** %2, align 8
  call void @llvm.dbg.declare(metadata %struct.Person** %2, metadata !22, metadata !23), !dbg !24
  %4 = load %struct.Person*, %struct.Person** %2, align 8, !dbg !25
  %5 = getelementptr inbounds %struct.Person, %struct.Person* %4, i32 0, i32 0, !dbg !26
  store i32 15, i32* %5, align 4, !dbg !27
  call void @llvm.dbg.declare(metadata i8** %3, metadata !28, metadata !23), !dbg !30
  %6 = load %struct.Person*, %struct.Person** %2, align 8, !dbg !31
  %7 = getelementptr inbounds %struct.Person, %struct.Person* %6, i32 0, i32 1, !dbg !32
  %8 = getelementptr inbounds [10 x i8], [10 x i8]* %7, i32 0, i32 0, !dbg !31
  store i8* %8, i8** %3, align 8, !dbg !30
  %9 = load i8*, i8** %3, align 8, !dbg !33
  %10 = load i8*, i8** %3, align 8, !dbg !33
  %11 = call i64 @llvm.objectsize.i64.p0i8(i8* %10, i1 false, i1 true), !dbg !33
  %12 = call i8* @__strncpy_chk(i8* %9, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i64 10, i64 %11) #5, !dbg !33
  %13 = load i8*, i8** %3, align 8, !dbg !34
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8* %13), !dbg !35
  ret void, !dbg !36
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @__strncpy_chk(i8*, i8*, i64, i64) #2

; Function Attrs: nounwind readnone speculatable
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1, i1) #1

declare i32 @printf(i8*, ...) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !37 {
  %1 = alloca %struct.Person, align 4
  call void @llvm.dbg.declare(metadata %struct.Person* %1, metadata !40, metadata !23), !dbg !41
  %2 = bitcast %struct.Person* %1 to i8*, !dbg !41
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast (%struct.Person* @main.p to i8*), i64 16, i32 4, i1 false), !dbg !41
  call void @func(%struct.Person* %1), !dbg !42
  ret i32 0, !dbg !43
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #4

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 5.0.2 (tags/RELEASE_502/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "test_store_gep_alias.c", directory: "/Users/yongzhehuang/Documents/pdg-projects/llvm_playground/test")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"PIC Level", i32 2}
!7 = !{!"clang version 5.0.2 (tags/RELEASE_502/final)"}
!8 = distinct !DISubprogram(name: "func", scope: !1, file: !1, line: 9, type: !9, isLocal: false, isDefinition: true, scopeLine: 9, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!9 = !DISubroutineType(types: !10)
!10 = !{null, !11}
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "Person", file: !1, line: 7, baseType: !13)
!13 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 4, size: 128, elements: !14)
!14 = !{!15, !17}
!15 = !DIDerivedType(tag: DW_TAG_member, name: "age", scope: !13, file: !1, line: 5, baseType: !16, size: 32)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !13, file: !1, line: 6, baseType: !18, size: 80, offset: 32)
!18 = !DICompositeType(tag: DW_TAG_array_type, baseType: !19, size: 80, elements: !20)
!19 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!20 = !{!21}
!21 = !DISubrange(count: 10)
!22 = !DILocalVariable(name: "p", arg: 1, scope: !8, file: !1, line: 9, type: !11)
!23 = !DIExpression()
!24 = !DILocation(line: 9, column: 19, scope: !8)
!25 = !DILocation(line: 10, column: 5, scope: !8)
!26 = !DILocation(line: 10, column: 8, scope: !8)
!27 = !DILocation(line: 10, column: 12, scope: !8)
!28 = !DILocalVariable(name: "name", scope: !8, file: !1, line: 11, type: !29)
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!30 = !DILocation(line: 11, column: 11, scope: !8)
!31 = !DILocation(line: 11, column: 18, scope: !8)
!32 = !DILocation(line: 11, column: 21, scope: !8)
!33 = !DILocation(line: 12, column: 5, scope: !8)
!34 = !DILocation(line: 13, column: 20, scope: !8)
!35 = !DILocation(line: 13, column: 5, scope: !8)
!36 = !DILocation(line: 14, column: 1, scope: !8)
!37 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 16, type: !38, isLocal: false, isDefinition: true, scopeLine: 16, isOptimized: false, unit: !0, variables: !2)
!38 = !DISubroutineType(types: !39)
!39 = !{!16}
!40 = !DILocalVariable(name: "p", scope: !37, file: !1, line: 17, type: !12)
!41 = !DILocation(line: 17, column: 12, scope: !37)
!42 = !DILocation(line: 18, column: 5, scope: !37)
!43 = !DILocation(line: 19, column: 1, scope: !37)
