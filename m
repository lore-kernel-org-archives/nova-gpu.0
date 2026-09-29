Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FC052CCFD
	for <nova-gpu@lists.linux.dev>; Tue, 29 Sep 2026 13:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790690388; cv=none; b=iuqP079E0ygr5Id82BJz4BrhugoEd55dtjhrD/8UKH4OsgCY6Hd62XBv2ZTb0o3nuGFnpnvP+Q+olyaEEE3xEYafvhcKud8NiluxSMsfZB6mKAJjqiTq0vIkA5NDyqBgZI+PRrcJnihSApELhOqj/EXwu/RtZfVaFj/dBcOQpvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790690388; c=relaxed/simple;
	bh=hHXBHcUCrIplq/Wbvx/jiQO/FmwElDLURzK8n9eyhEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T0jUn43uci3CrCJuO/CX2z+q5yn9tQ+IwtvAU2Axnz4yiczideBihOvAxDeMqOkvTyKo/kjOpKN27fn3R192TEcX6bwKagUaPUf4NJSI1WGxSVR19yO5ZbTOPQX/ZY6HALy0+LhbXj+EzVcni9UpDDTssW//4dpGte6DDEMzt9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ovo4oitI; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ovo4oitI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=P7
	+Vtttm2uMFnng78VS5Um+xosrpZpAVlqn0HxUOE0g=; b=ovo4oitIGFGryFz4A5
	UZt1yTJrhBLg1U1H5Dz2ApGkVw4vvfdmsUV8FntmhQJ0HgsYRk29n26IrdNTyiO7
	sWZtkUAVUc1iFvv7cOK9IXFmIU7IXJmmfE3zSaRDbhgOaMPRVVfcfXF9SuvspeKX
	NVhzOeFCz1SdJ+4IRxgk/i7xM=
Received: from localhost.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgDX8L8hxLtqbwr+Bg--.43938S2;
	Tue, 29 Sep 2026 21:59:03 +0800 (CST)
From: Kaiqi Guo <chaoji_xinren@163.com>
To: rust-for-linux@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Jesung Yang <y.j3ms.n@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>
Cc: nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Kaiqi Guo <chaoji_xinren@163.com>,
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
Subject: [PATCH v6 00/10] rust: add conversion derives and exhaustive From support
Date: Tue, 29 Sep 2026 21:58:45 +0800
Message-ID: <20260929135855.36775-1-chaoji_xinren@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgDX8L8hxLtqbwr+Bg--.43938S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Xr4fCr4UXr1xAFy5KF1xXwb_yoWxGF47pF
	4qk3yYkr48C3WfG39Fya1UZa45GFWfJFW5XF17Jw4DursIkr10qrWDKw4Y9F9rC340v39I
	9r1Fyr1kCa4jva7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zi75r7UUUUU=
X-CM-SenderInfo: pfkd0yplb0x0xuhqqiywtou0bp/xtbC4QnEQGq7xCnaGgAA3Q

Nova register enums need conversions to and from integer fields. This
series adds Into and TryFrom derives and a shared convert helper, then
adds From for enums that cover every possible input value. Two Nova
register enums use the derives without changing their conversion results
or error types.

This continues Jesung Yang's work. The first five patches preserve his
authorship and implementation from the unpublished tryfrom-into-macro.v6
branch [1], rebased onto rust-next. Jesung has not formally posted this
v6 series. The remaining five patches fix test and name-resolution issues,
add exhaustive conversions, and exercise them in Nova. The last public
submission I found is v5 [2]; the v6 branch was announced in March [3].
The v6 numbering here follows that public submission history.

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

Changes since the public v5:

- Preserve Jesung's shared convert helper and replacement of from_expr
  with per-variant Bounded::new const-generic constructors.
- Preserve his separate private Into and TryFrom doctest patches.
- Rebase onto d266640c6c76, retaining the new ForLt/CovariantForLt macros.
- Correct repr(C) negative examples that still used structs, and make
  the negative unsigned Bounded tests exercise conversion overflow.
- Add From/from and compile-pass/fail tests for exhaustive conversions.
- Reject generic arguments on primitive helper types and qualify generated
  Result and Bounded backing-type names against local aliases.
- Migrate Architecture to TryFrom/Into and FalconCoreRevSubversion to
  From/Into, preserving EINVAL and Infallible respectively.

Two earlier API questions remain deliberately visible for review:

- The absence of an explicit integer repr still defaults to isize.
- Helper arguments still override the repr-derived conversion type;
  they do not add an extra implementation for that repr type.

These retain Jesung's v6 choices. TryFrom also retains Error/EINVAL;
context-specific errors remain the caller's responsibility. This series
does not change Chipset's ENODEV conversion or add a configurable error
API. Bounded constructor support is unchanged (up to 64-bit and pointer
width backing integers); primitive u128/i128 domains are checked too.

Validation on Debian arm64, Rust 1.85.1, LLVM 19.1.7, bindgen 0.71.1:

- Rust and drivers/gpu/nova-core.o builds passed.
- rusttest: 128 doctests passed, 4 existing examples ignored.
- rustfmtcheck, CLIPPY=1 builds, and rustdoc passed.
- rust/.kunitconfig under arm64 QEMU: 360 tests passed.
- Exhaustive before/after comparison of the actual Nova declarations:
  Architecture 64/64 inputs identical (6 successes, 58 EINVAL), and
  FalconCoreRevSubversion 4/4 identical, including round trips and the
  Infallible error type.
- Separate negative-test probes checked the expected diagnostic for
  missing values, gaps, overflow, and duplicate discriminants.

No NVIDIA hardware testing was performed. checkpatch reports no errors;
the preserved original patches retain a new-file MAINTAINERS reminder
and one 120-column doctest line warning. The five follow-up patches have
no checkpatch warnings. Previous review/test tags dropped by Jesung are
not restored, and no new review, test, or ack tags are claimed.

Base: rust-next d266640c6c760c9bc215bf5a3ece122ca488b6f5

[1] https://github.com/J3m3/linux/tree/2ea456bd5f26bd66c766b462a7d606d9842c208a
[2] https://lore.kernel.org/rust-for-linux/20260129-try-from-into-macro-v5-0-dd011008118c@gmail.com/
[3] https://lore.kernel.org/rust-for-linux/DH939HK0611M.22A8T9BJ3NG8@gmail.com/
[4] https://lore.kernel.org/rust-for-linux/DHHJCEG8BC47.2VC6GLDRRZH1B@nvidia.com/
[5] https://lore.kernel.org/rust-for-linux/DHHK2OJ6O83V.2MZNHRQYK21EU@nvidia.com/

--
This series is based on Jesung's five commits below, followed by five
separate continuation commits.

Jesung Yang (5):
  rust: macros: add derive macro for `Into`
  rust: macros: add derive macro for `TryFrom`
  rust: macros: add `convert` helper attribute
  rust: macros: add private doctests for `Into` derive macro
  rust: macros: add private doctests for `TryFrom` derive macro

Kaiqi Guo (5):
  rust: macros: exercise the intended conversion doctest failures
  rust: macros: derive From for exhaustive enum conversions
  rust: macros: test exhaustive conversion derives
  rust: macros: validate and qualify conversion helper types
  gpu: nova-core: use conversion derives for two register enums

 drivers/gpu/nova-core/falcon.rs |   19 +-
 drivers/gpu/nova-core/gpu.rs    |   22 +-
 rust/macros/convert.rs          | 2093 +++++++++++++++++++++++++++++++
 rust/macros/lib.rs              |  522 +++++++-
 4 files changed, 2633 insertions(+), 23 deletions(-)
 create mode 100644 rust/macros/convert.rs


base-commit: d266640c6c760c9bc215bf5a3ece122ca488b6f5

