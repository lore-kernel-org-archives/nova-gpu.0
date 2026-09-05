Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8C3374E5B;
	Sat,  5 Sep 2026 23:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788649937; cv=none; b=qXZ0VVPl16vi2XcOPj6fOOdd4AtNpqYG78b4cSLRyG7i4js2q8i5cQa1nOI/z9D+dGGrtwoMOJ2zWXDnQ8piLoZHmkeRdV7mTxBNl+cRX2iXSvXAnUE0Z0sse43al6jxqVhDckOpPWyvshiZL0BN3G8A6nwA2gg3gqJNR2ZMCqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788649937; c=relaxed/simple;
	bh=DoVSC1fhlioAlinlkDSEkN7ODDfYCA77qXHG7mHG0R4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TF6noM571iQzXo1/E9JF280YoXOWXyx/m6UjAzL5pX6LPwzwWlkZyDEaiFeOXFDwt6EzXzWzY64LX2Za055mNjP6FuU27MNTHW50qQUF6BsPVq2ALvvoRN57vj+6btepuvpUCqKYxiSDBGCXu7KJpp40A74e4ImNUzDqc7WenQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IvWVhgLU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IvWVhgLU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5FB41F00A3A;
	Sat,  5 Sep 2026 23:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788649936;
	bh=Yy3lD8Cq1n7kC4ScfAeBgM+F92uIGUofo0TrwsUicyI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IvWVhgLUWTemcUTV16INXhHHyJgO0FJY4YdcGcxbC2vH3sAyh15H4mwuB4YOCWz9j
	 tT6TqYzpsDcAqj+Cb/SCrq1jUX48EmOKdRGvx/7QTuBO1168FQFnVdpVFvuZ0weaDw
	 BKWQ/NodNXupHE+RhUVth1vZ5hrDGmzk5wfqvydtpzgARKuwZk8Oqb/G3/oKDf7Tdz
	 adH+TQEdC4ObgqJ8g82Vv327tw1qS6ZC6kLcMXJDF0AAa5XbLGdmQxpCHx786jOO3j
	 BzXG3Brgz/uhhhGcQTCHgT/Fu1V2+Sn2XUIKRGKHZ2QFsJLQB0E2d9MKa6zIhp/jn1
	 39Y7rJKYVJevA==
From: Danilo Krummrich <dakr@kernel.org>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	nova-gpu@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] gpu: nova-core: gsp: fix a broken doc link on GspMessage
Date: Sun,  6 Sep 2026 01:12:08 +0200
Message-ID: <20260905231208.2946715-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905023800.1293631-1-jhubbard@nvidia.com>
References: <20260905023800.1293631-1-jhubbard@nvidia.com>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri,  4 Sep 2026 19:38:00 -0700, John Hubbard wrote:
> [PATCH] gpu: nova-core: gsp: fix a broken doc link on GspMessage

Applied, thanks!

  Branch: drm-rust-next
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[1/1] gpu: nova-core: gsp: fix a broken doc link on GspMessage
      commit: e1df8a1560a9

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for the upcoming merge window for the next major kernel
release.
