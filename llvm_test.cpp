#ifndef LLVM_TEST_H
#define LLVM_TEST_H

#include "llvm/IR/GlobalAlias.h"
#include "llvm/IR/DebugInfo.h"
#include "llvm/IR/GlobalVariable.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h" 
#include "llvm/IR/InstIterator.h"
#include "llvm/IR/InstrTypes.h"
#include "ProgramDependencyGraph.hh"

#include <vector>
#include <set>
#include <map>

namespace {
    using namespace llvm;
    /* using namespace SVF; */

    class llvmTest : public ModulePass {
        public:
            static char ID;

            llvmTest() : ModulePass(ID) {
            }

            bool runOnModule(Module &M) override
            {
                auto PDG = getAnalysis<pdg::ProgramDependencyGraph>().getPDG();
                for (auto &F : M) 
                {
                    if (F.isDeclaration())
                        continue;
                    for (auto instI = inst_begin(F); instI != inst_end(F); ++instI) {
                        pdg::Node* n = PDG->getNode(*instI);
                        if (n == nullptr)
                            continue;
                        // print neighbors
                        auto inEdges = n->getInEdgeSet();
                        auto outEdges = n->getOutEdgeSet();
                        for (auto inEdge : inEdges) {
                            if (inEdge->getEdgeType() == pdg::EdgeType::DATA_DEF_USE)
                                errs() << "find def use in neighbor: " << *inEdge->getSrcNode()->getValue() << "\n";
                        }
                        errs() << " =================================================================  \n";
                        for (auto outEdge : outEdges) {
                            if (outEdge->getEdgeType() == pdg::EdgeType::DATA_DEF_USE)
                                errs() << "find def use out neighbor: " << *outEdge->getDstNode()->getValue() << "\n";
                        }

                    }
                }

                return false;
            }

            llvm::StringRef getPassName() const override { return "LLVM Test"; }

            void getAnalysisUsage(AnalysisUsage &AU) const override
            {
                AU.addRequired<pdg::ProgramDependencyGraph>();
                AU.setPreservesAll();
            }
    };

    char llvmTest::ID = 0;
    static RegisterPass<llvmTest> X("llvm-test", "LLVM TEST", false, true);
} // namespace
#endif
