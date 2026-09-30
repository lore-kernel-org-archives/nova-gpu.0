Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888E9125A0
	for <nova-gpu@lists.linux.dev>; Wed, 30 Sep 2026 00:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790727930; cv=none; b=edaBpQ5Bn2MjK0Vqt0ZXiKQXMfIhbct556ByWlvRyLfFn+YZOwBHDgG8aSQM/GR45Nh65YPrKnLOPv3ITGtRZIGBP47mzsGF9GWvUBDF3aj57FJjL9ct9wvWDwtJCBQkd4StgzbTvRRMuMkFVH9qz6ccOYjkVEYpSPjhS1vJTCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790727930; c=relaxed/simple;
	bh=5FZGYYzwwTM8HiBoAVMRAanMVk6wVoVeSnqkt0kmq54=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MQvG6NPyeghJ3EaxT2+M6FHFtOSDgam83li6iRhYxKKLqWl3L7sqBJsLLdwI73SGQpGnozjdoHIR8QKPKapqOEYdxCbCCWR2hZszbU6M0nX0VuPL2VwUbySvbfsqt7EBQaZUi5e64LBCNG6NfNRwBtnN629tq/pwASqEk/ZVU7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=bs6jhJtb; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="bs6jhJtb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=AA
	WTDyH5WZ1cf9Z5VfkCP2CQMJKV6qkp/hecWMS/VO4=; b=bs6jhJtbHwSGw5aUht
	rRB9JRo+Mb76Du1B9On083dxB4vw9Rp9uhEgkKoLKvslii3a9yb+O0KqpdDaM/q5
	vq1xddh9ch1bWsmYvC8M1RCSWmqPIA9rXQ51lHI0kF0GLlK5Rv0za/I+gJwremvE
	JY85KKy8d+lC/+sVJbEF3eX1M=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgBXnq7EVrxq2GTBBw--.56601S2;
	Wed, 30 Sep 2026 08:24:39 +0800 (CST)
From: Kaiqi Guo <chaoji_xinren@163.com>
To: Jesung Yang <y.j3ms.n@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	bjorn3_gh@protonmail.com,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	work@onurozkan.dev,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Charalampos Mitrodimas <charmitro@posteo.net>,
	shivamklr@cock.li,
	Kaiqi Guo <chaoji_xinren@163.com>
Subject: [PATCH v7 00/11] rust: add conversion derives and exhaustive From support
Date: Wed, 30 Sep 2026 08:24:25 +0800
Message-ID: <20260930002436.21395-1-chaoji_xinren@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgBXnq7EVrxq2GTBBw--.56601S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Ary5JrW7Ww4DCw13JFW3GFg_yoWxWF45pF
	4DK3yUKr48J3WfG39Fya1UZFy5GayfJF45WFnrJw4DursxCr1IqrW8K3ya9F9rA34jg39I
	qrn0qw1v9a4qyFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zi75r7UUUUU=
X-CM-SenderInfo: pfkd0yplb0x0xuhqqiywtou0bp/xtbC-giRDWq8VsiDHgAA3-

To: Jesung Yang <y.j3ms.n@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
 nova-gpu@lists.linux.dev,
 dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>,
 work@onurozkan.dev,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Charalampos Mitrodimas <charmitro@posteo.net>,
 Shivam Kalra <shivamklr@cock.li>

Nova register enums need conversions to and from integer fields. This
series adds Into and TryFrom derives and a shared convert helper, then
adds From for enums that cover every possible input value. Two Nova
register enums use the derives without changing their conversion results
or error types.

This continues Jesung Yang's work. The first five patches preserve his
authorship and implementation from the unpublished tryfrom-into-macro.v6
branch [1], rebased onto rust-next. Jesung's last public submission was
v5 [2]; the v6 branch was announced in March [3]. The remaining six
patches fix tests and name resolution, add exhaustive conversions, use
them in Nova, and address findings received during v6 review.

Alexandre requested an infallible Bounded-to-enum conversion when the enum
covers the entire field [4], referring to bounded_enum!'s compile-time
exhaustiveness check [5]. This version adds:

    #[derive(kernel::macros::From, kernel::macros::Into)]
    #[convert(Bounded<u8, 2>)]
    enum Mode {
        A = 0,
        B = 1,
        C = 2,
        D = 3,
    }

The direction-specific spelling is #[derive(From)] with #[from(...)].
From also supplies the standard blanket TryFrom with Error = Infallible;
an explicit TryFrom derive for the same input would conflict with it.

The exhaustiveness proof reuses the existing per-discriminant range
assertions and Rust's rejection of duplicate discriminants. It checks
that the number of distinct variants equals the input domain size,
comparing spans to avoid overflowing a full-width cardinality. The
generated function compares all but the final variant, then returns that
variant. Missing values, gaps, and out-of-range discriminants fail at
compile time even without a call site. No panic or unsafe path is needed.

This count-based proof is a new implementation choice, rather than the
MAX.. match pattern suggested in the thread. Review of this choice and
the From/from spelling would be welcome. No new conversion trait or
Bounded abstraction is introduced.

Changes since v6:

- Format the new conversion doctest imports vertically.
- Avoid unused_variables and dead_code warnings for empty TryFrom enums.
- Allow generated fits() comparisons at 128-bit boundaries, where rustc
  identifies a comparison against the type maximum as always true.
- Consume nested repr arguments such as #[repr(u8, align(4))], preserving
  rustc's own validation of the attribute.
- Reject bool as a Bounded backing type in helper arguments.
- Add compile-pass and compile-fail regression doctests for these cases.

Two earlier API questions remain visible for review:

- The absence of an explicit integer repr still defaults to isize.
- Helper arguments still override the repr-derived conversion type;
  they do not add an extra implementation for that repr type.

These retain Jesung's v6 choices. TryFrom also retains Error/EINVAL;
context-specific errors remain the caller's responsibility. This series
does not change Chipset's ENODEV conversion or add a configurable error
API. Bounded constructor support is unchanged (up to 64-bit and pointer
width backing integers); primitive u128/i128 domains are checked too.

Validation:

- The v6 code passed Rust and Nova builds, rusttest, rustfmtcheck,
  CLIPPY=1 builds, rustdoc, and arm64 QEMU KUnit (360 tests).
- The v7 changes passed direct proc-macro compilation with rustc 1.97,
  rustfmt --check, git diff --check, and checkpatch for patch 11.
- The preserved Jesung patches retain two existing checkpatch warnings: a
  MAINTAINERS reminder on the new file and one long doctest attribute line.
- Direct -D warnings probes compiled and ran empty-enum TryFrom, u128
  boundary conversion, and #[repr(u8, align(4))] Into; an invalid
  Bounded<bool, 1> helper was rejected with the intended diagnostic.
- Full v7 kernel rusttest/rustfmtcheck could not run on this macOS host:
  GNU Make 3.81 is installed, while the kernel requires version 4.0.

No NVIDIA hardware testing was performed. Previous review, test, or ack
tags are not claimed.

[1] https://github.com/J3m3/linux/tree/2ea456bd5f26bd66c766b462a7d606d9842c208a
[2] https://lore.kernel.org/rust-for-linux/20260129-try-from-into-macro-v5-0-dd011008118c@gmail.com/
[3] https://lore.kernel.org/rust-for-linux/DH939HK0611M.22A8T9BJ3NG8@gmail.com/
[4] https://lore.kernel.org/rust-for-linux/DHHJCEG8BC47.2VC6GLDRRZH1B@nvidia.com/
[5] https://lore.kernel.org/rust-for-linux/DHHK2OJ6O83V.2MZNHRQYK21EU@nvidia.com/

Jesung Yang (5):
  rust: macros: add derive macro for `Into`
  rust: macros: add derive macro for `TryFrom`
  rust: macros: add `convert` helper attribute
  rust: macros: add private doctests for `Into` derive macro
  rust: macros: add private doctests for `TryFrom` derive macro

Kaiqi Guo (6):
  rust: macros: exercise the intended conversion doctest failures
  rust: macros: derive From for exhaustive enum conversions
  rust: macros: test exhaustive conversion derives
  rust: macros: validate and qualify conversion helper types
  gpu: nova-core: use conversion derives for two register enums
  rust: macros: address conversion derive review findings

 drivers/gpu/nova-core/falcon.rs |   19 +-
 drivers/gpu/nova-core/gpu.rs    |   22 +-
 rust/macros/convert.rs          | 2180 +++++++++++++++++++++++++++++++
 rust/macros/lib.rs              |  522 +++++++-
 4 files changed, 2720 insertions(+), 23 deletions(-)
 create mode 100644 rust/macros/convert.rs


base-commit: d266640c6c760c9bc215bf5a3ece122ca488b6f5
-- 
2.50.1 (Apple Git-155)

