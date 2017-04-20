/*
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

func TestSimdSse2SquaredDifferenceSum(t *testing.T) {
	a, b := View{}, View{}
	a.Recreate(Resolution, Resolution, GRAY8)
	b.Recreate(Resolution, Resolution, GRAY8)
	SimdSse2SquaredDifferenceSum(a, b)

	a, b = View{}, View{}
	a.Recreate(Resolution, Resolution, FLOAT)
	b.Recreate(Resolution, Resolution, FLOAT)
	SimdSse2SquaredDifferenceSum(a, b)
}

func TestSimdSse2SquaredDifferenceSumMasked(t *testing.T) {

	a, b, m := View{}, View{}, View{}
	a.Recreate(Resolution, Resolution, GRAY8)
	b.Recreate(Resolution, Resolution, GRAY8)
	m.Recreate(Resolution, Resolution, GRAY8)
	SimdSse2SquaredDifferenceSumMasked(a, b, m, 17)

	a, b, m = View{}, View{}, View{}
	a.Recreate(Resolution, Resolution, FLOAT)
	b.Recreate(Resolution, Resolution, FLOAT)
	m.Recreate(Resolution, Resolution, FLOAT)
	SimdSse2SquaredDifferenceSumMasked(a, b, m, 17)
}
