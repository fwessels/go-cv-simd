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

import "testing"

func TestSse2Bgr48pToBgra32(t *testing.T) {

	bgra, _ := SimdSetup(BGRA32)

	b, g, r := View{}, View{}, View{}
	b.Recreate(Resolution, Resolution, INT16)
	g.Recreate(Resolution, Resolution, INT16)
	r.Recreate(Resolution, Resolution, INT16)

	SimdSse2Bgr48pToBgra32(b, g, r, bgra, 0xff)
}
