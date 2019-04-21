clang -emit-llvm -S -g *.c
#clang --target=x86_64-unknown-linux-gnu -emit-llvm -S *.c
for f in *.ll; do
    llvm-as $f
done

mv *.ll ./llvm_ll
mv *.bc ./bitcode
