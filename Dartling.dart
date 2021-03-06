/*
http://opensource.org/licenses/

http://en.wikipedia.org/wiki/BSD_license
3-clause license ("New BSD License" or "Modified BSD License")

Copyright (c) 2012, Dartling project authors
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the Dartling nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

#library('Dartling');

#import('../unittest/unittest.dart');
#import('dart:json');
#import('dart:uri');

#source('data/link/categories.dart');
#source('data/link/data.dart');
#source('data/link/webLinks.dart');
#source('data/project/data.dart');
#source('data/project/projects.dart');
#source('data/user/data.dart');
#source('data/user/members.dart');

#source('domain/data.dart');
#source('domain/session.dart');

#source('event/reactions.dart');
#source('event/actions.dart');

#source('exception/errors.dart');
#source('exception/exceptions.dart');

#source('guid/id.dart');

#source('meta/attributes.dart');
#source('meta/children.dart');
#source('meta/concepts.dart');
#source('meta/domains.dart');
#source('meta/models.dart');
#source('meta/neighbor.dart');
#source('meta/parents.dart');
#source('meta/property.dart');
#source('meta/types.dart');

#source('model/data.dart');
#source('model/entities.dart');
#source('model/entity.dart');
#source('model/id.dart');

#source('test/link/data.dart');
#source('test/link/model.dart');
#source('test/project/data.dart');
#source('test/user/data.dart');
#source('test/lastGroupTest.dart');
#source('test/lastSingleTest.dart');

#source('transfer/json.dart');

allTests() {
  testProjectData();
  testUserData();
  testLinkData();
  testLinkModel();
  //lastSingleTest();
  //lastGroupTest();
}

void main() {
  //testLinkData();
  allTests();
}