/*
 * Minio Cloud Storage, (C) 2017 Minio, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package gocvsimd

import (
	"testing"
)

func testClibFloor32(t *testing.T, fl, expected float32) {

	got := _ClibFloor32(fl)
	if expected != got {
		t.Errorf("testClibFloor32(): \nexpected %v\ngot      %v", expected, got)
	}
}

func testClibFloor64(t *testing.T, fl, expected float64) {

	got := _ClibFloor64(fl)
	if expected != got {
		t.Errorf("testClibFloor64(): \nexpected %v\ngot      %v", expected, got)
	}
}

func TestClibFloor(t *testing.T) {

	testClibFloor32(t, 2.1, 2.0)
	testClibFloor32(t, 1.9, 1.0)
	testClibFloor32(t, 1.5, 1.0)
	testClibFloor32(t, 1.1, 1.0)
	testClibFloor32(t, 1.0, 1.0)
	testClibFloor32(t, 1.0-1e-6, 0.0)
	testClibFloor32(t, 0.0-1e-6, -1.0)

	testClibFloor64(t, 2.1, 2.0)
	testClibFloor64(t, 1.9, 1.0)
	testClibFloor64(t, 1.5, 1.0)
	testClibFloor64(t, 1.1, 1.0)
	testClibFloor64(t, 1.0, 1.0)
	testClibFloor64(t, 1.0-1e-6, 0.0)
	testClibFloor64(t, 0.0-1e-6, -1.0)

}
