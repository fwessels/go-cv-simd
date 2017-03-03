//+build !noasm
//+build !appengine

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
	"fmt"
	"testing"
)

func TestReorder(t *testing.T) {

	src := make([]byte, 256)

	src[0] = 3
	src[1] = 2
	src[2] = 1
	src[3] = 0
	src[4] = 7
	src[5] = 6
	src[6] = 5
	src[7] = 4
	src[8] = 11
	src[9] = 10
	src[10] = 9
	src[11] = 8
	src[12] = 15
	src[13] = 14
	src[14] = 13
	src[15] = 12

	dst := make([]byte, 256)

	fmt.Println()
	fmt.Println("before")
	for i := 0; i < 16; i++ {
		fmt.Println(i, src[i], dst[i])
	}

	Reorder32bit(&src, 16, &dst)

	fmt.Println()
	fmt.Println("after")
	for i := 0; i < 16; i++ {
		fmt.Println(i, src[i], dst[i])
	}
}
