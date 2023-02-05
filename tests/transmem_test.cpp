//
// The BSD 3-Clause License. http://www.opensource.org/licenses/BSD-3-Clause
//
// This file is part of MinGW-W64(mingw-builds: https://github.com/niXman/mingw-builds) project.
// Copyright (c) 2011-2023 by niXman (i dotty nixman doggy gmail dotty com)
// Copyright (c) 2012-2015 by Alexpux (alexpux doggy gmail dotty com)
// All rights reserved.
//
// Project: MinGW-Builds ( https://github.com/niXman/mingw-builds )
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
// - Redistributions of source code must retain the above copyright
//     notice, this list of conditions and the following disclaimer.
// - Redistributions in binary form must reproduce the above copyright
//     notice, this list of conditions and the following disclaimer in
//     the documentation and/or other materials provided with the distribution.
// - Neither the name of the 'MinGW-W64' nor the names of its contributors may
//     be used to endorse or promote products derived from this software
//     without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
// A PARTICULAR PURPOSE ARE DISCLAIMED.
// IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
// OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
// USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
// **************************************************************************

extern "C" void abort ();

int dothrow;
int g;

static void f1()
{
  g++;
  if (dothrow)
    throw 1;
}

static void f2()
{
  __transaction_atomic {
    f1();
  }
}

int main()
{
  dothrow = 0;
  f2();

  dothrow = 1;
  try {
    f2();
  } catch (...) {
  }

  return (g != 2);
}
