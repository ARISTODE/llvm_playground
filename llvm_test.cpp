#ifndef LLVM_TEST_H
#define LLVM_TEST_H

#include "llvm/Analysis/AliasAnalysis.h"
#include "llvm/Analysis/CFLSteensAliasAnalysis.h"
#include "llvm/Analysis/CFLAndersAliasAnalysis.h"
#include "llvm/Analysis/MemoryLocation.h"
#include "llvm/Analysis/MemoryBuiltins.h"
#include "llvm/Analysis/MemoryDependenceAnalysis.h"
#include "llvm/Analysis/TargetLibraryInfo.h"

#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h" 
#include "llvm/IR/InstIterator.h"
#include <vector>
#include <set>
#include <string.h>

namespace {
    using namespace llvm;

    class llvmTest : public ModulePass {
    public:
        static char ID;

        llvmTest() : ModulePass(ID) {
        }

        StoreInst* getArgStore(Argument* arg) {
            for (auto UI = arg->user_begin(); UI != arg->user_end(); ++UI) {
                if (StoreInst *st = dyn_cast<StoreInst>(*UI)) {
                    return st;
                }
            }
            return nullptr;
        }

        AllocaInst* getArgAllocaInst(Argument *arg) {
            StoreInst* st = getArgStore(arg);
            if (st == nullptr) {
                return nullptr;
            } 

            if (AllocaInst* ai = dyn_cast<AllocaInst>(st->getPointerOperand())) {
                return ai;
            }

            return nullptr;
        }

        bool runOnModule(Module &M)
        {
            for (Function &F : M)
            {
                if (F.isDeclaration() or F.getName() == "main")
                {
                    continue;
                }

                for (Argument &arg : F.args())
                {
                    if (!isa<PointerType>(arg.getType()))
                    {
                        continue;
                    }

                    PointerType *pt = dyn_cast<PointerType>(arg.getType());
                    Type *eleTy = pt->getElementType();

                    if (eleTy->isSingleValueType())
                    {
                        continue;
                    }

                    for (unsigned int i = 0; i < eleTy->getNumContainedTypes(); i++)
                    {
                        Type* curTy = arg.getType()->getContainedType(0)->getContainedType(i);
                        errs() << "[" << F.getName().str() << "]" << curTy->getTypeID() << "\n";
                        // if (PointerType* subPt = dyn_cast<PointerType>(curTy)) {
                        //     errs() << ""
                        // }
                    }
                }
            }
            return false;
        }

        // do main work here
        // bool runOnModule(Module &M)
        // {
        //     aliasName = {"NoAlias", "MayAlias", "PartialAlias", "MustAlias"};
        //     std::vector<Instruction*> storevec;
        //     std::vector<Instruction*> loadvec;
        //     /* std::vector<Instruction*> gepvec; */
        //     steensAA = &getAnalysis<CFLSteensAAWrapperPass>().getResult();
        //     andersAA = &getAnalysis<CFLAndersAAWrapperPass>().getResult();
        //     for (Function &F : M)
        //     {

        //         Function *func = &F;
        //         if (F.isDeclaration() or F.getName() == "main") {
        //             continue;
        //         }

        //         /* for (inst_iterator instI = inst_begin(func); instI != inst_end(func); ++instI) { */
        //         /*     if (CallInst *call_inst = dyn_cast<CallInst>(&*instI)) { */
        //         /*         errs() << call_inst->getCalledFunction()->getName() << "\n"; */
        //         /*         for (unsigned i = 0; i < call_inst->getNumArgOperands(); ++i) { */
        //         /*             //Type *ty = call_inst->getArgOperand(i)->getType(); */
        //         /*             //errs() << *(call_inst->getArgOperand(i)) << "\n"; */
        //         /*             if (PointerType *pt = dyn_cast<PointerType>((call_inst->getArgOperand(i))->getType())) { */
        //         /*                 errs() << *(call_inst->getArgOperand(i)) << "\n"; */
        //         /*                 errs() << pt->getElementType()->getTypeID() << "\n"; */
        //         /*                 /1* errs() << (call_inst->getArgOperand(i))->getType()-> << "\n"; *1/ */
        //         /*             } */
        //         /*             if (GetElementPtrInst *gep = dyn_cast<GetElementPtrInst>(&*(call_inst->getArgOperand(i)))) { */
        //         /*                 errs() << *gep << "\n"; */
        //         /*             } */
        //         /*         } */
        //         /*     } */
        //         /* } */

        //         if (func->getName() != "register_device") {
        //             continue;
        //         }

        //         //AA = &getAnalysis<AAResultsWrapperPass>(F).getAAResults();
        //         //steensAA = &getAnalysis<CFLSteensAAWrapperPass>(F).getResult();

        //         errs() << "[For function: " << F.getName() << "]\n";

        //         /* for (inst_iterator I = inst_begin(func), IE = inst_end(func); I != IE; ++I) */
        //         /* { */
        //         /*     if (CallInst* callInst = dyn_cast<CallInst>(&*I)) { */
        //         /*         for (auto arg_iter = callInst->arg_begin(); arg_iter != callInst->arg_end(); ++arg_iter) { */
        //         /*             if (Instruction* inst = dyn_cast<Instruction>(&*arg_iter)) { */
        //         /*                 errs() << *inst << "\n"; */
        //         /*             } */
        //         /*         } */
        //         /*     } */
        //         /* } */


        //         for (inst_iterator I = inst_begin(func), IE = inst_end(func); I != IE; ++I) {
        //             Instruction *pInstruction = &*I;

        //             if (isa<LoadInst>(pInstruction)) {
        //                 loadvec.push_back(pInstruction);
        //             }

        //             if (isa<StoreInst>(pInstruction)) {
        //                 storevec.push_back(pInstruction);
        //             }
        //             /* if (isa<GetElementPtrInst>(pInstruction)) { */
        //             /*     gepvec.push_back(pInstruction); */ 
        //             /* } */
        //         }

        //         /* for (inst_iterator I = inst_begin(func), IE = inst_end(func); I != IE; ++I) { */
        //         /*     Instruction *pInstruction = &*I; */ 
        //         /*     if (isa<DbgDeclareInst>(pInstruction)) { */
        //         /*         continue; */
        //         /*     } */
        //         /*     if (ImmutableCallSite CS = ImmutableCallSite(pInstruction)) { */
        //         /*         unsigned i = 0; */
        //         /*         errs() << CS.getCalledFunction()->getName() << "\n"; */
        //         /*         for (auto arg_iter = CS.arg_begin(); arg_iter != CS.arg_end(); ++arg_iter) { */
        //         /*             MemoryLocation arg_loc = MemoryLocation::getForArgument(CS, i, getAnalysis<TargetLibraryInfoWrapperPass>().getTLI()); */
        //         /*             for (Instruction* li : loadvec) { */
        //         /*                 MemoryLocation L_loc = MemoryLocation::get(li); */ 
        //         /*                 AliasResult AA_Result = steensAA->query(arg_loc, L_loc); */
        //         /*                 errs() << "For the " << i << "th argument" << "\n"; */
        //         /*                 errs() << *li << "\n"; */
        //         /*                 errs() << aliasName[AA_Result] << "\n"; */
        //         /*             } */
        //         /*             i++; */
        //         /*         } */
        //         /*     } */
        //         /* } */


        //         for (auto argI = func->arg_begin(); argI != func->arg_end(); ++argI)
        //         {
        //             StoreInst *argStore = getArgStore(&*argI);
        //             MemoryLocation argS_Loc = MemoryLocation::get(argStore);
        //             for (Instruction *si : storevec) {
        //                 /* if (si == argStore) { */
        //                 /*     continue; */
        //                 /* } */
        //                 MemoryLocation S_Loc = MemoryLocation::get(si);
                        
        //                 for (Instruction *li : loadvec) {
        //                     MemoryLocation SS_Loc = MemoryLocation::get(li);
        //                     //AliasResult AA_Result = AA->alias(S_Loc, L_Loc);
        //                     AliasResult AA_Result = steensAA->alias(S_Loc, SS_Loc);
        //                     errs() << "------------------" << "\n";
        //                     errs() << *si << "\n";
        //                     errs() << *li << "\n";
        //                     errs() << aliasName[AA_Result] << "\n";
        //                 }
        //                 /* AliasResult AA_Result = AA->alias(argS_Loc, S_Loc); */
        //                 /* errs() << *argStore << "\n"; */
        //                 /* errs() << *si << "\n"; */
        //                 /* errs() << aliasName[AA_Result] << "\n"; */
        //             }
        //         }
        //     }
        //     return false;
        // }

        // Analysis Usage, specify PDG at this time
        void getAnalysisUsage(AnalysisUsage &AU) const {
            AU.addRequired<AAResultsWrapperPass>();
            AU.addRequired<MemoryDependenceWrapperPass>();
            AU.addRequired<CFLSteensAAWrapperPass>();
            AU.addRequired<CFLAndersAAWrapperPass>();
            AU.addRequired<TargetLibraryInfoWrapperPass>();
            AU.setPreservesAll();
        }

    private:
        AliasAnalysis *AA;
        CFLSteensAAResult *steensAA;
        CFLAndersAAResult *andersAA;
        std::vector<std::string> aliasName;
    };

    char llvmTest::ID = 0;
    static RegisterPass<llvmTest> llvmTest("llvm-test", "LLVM TEST", false, true);
} // namespace

#endif
