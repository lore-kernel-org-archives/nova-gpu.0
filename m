Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE3D3148D3;
	Wed,  1 Jul 2026 21:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782940084; cv=none; b=QXbSTgEB43c+P4H9ubFSu7KfOg/uZh3RNDztwhl+6j2ZhHO5Qd0W9Sx+tinBFe8lgVpY6qWVq4Vmrl2NBLha8tD7qEBVAN77BU0S8bN4J4ZIiEAr6v+nTYyXGe/+p5wTtg00iDpJ4SUzCOTA5DQjR/8pzRkrnjzSvNSvENnpqnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782940084; c=relaxed/simple;
	bh=7ioIJlu7CsfQqntenae0xKbjFHkGAJzt2hln06PlzcA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XqZI7xeHt2T+CUdN9gCTIzasjwhofsG7GUo2Sf6dMsfJ6EzhMcSt52Xp8M+/yoG6Notr0aU8r8w/uN8s+OfZ7lM4FrAkrUxaf4Zjb/4oFD7zO8LVp/jcmwmi0+YS5CcY4Ji8s4BTfEupmTRqsoljGfdtEALKCR9JMHCi6yPX7ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R05xdlt9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R05xdlt9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA721F000E9;
	Wed,  1 Jul 2026 21:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782940083;
	bh=n7TjrDqsTEXkjC3PhmRlxBihqIlnrgHLtJxV5VcmAZc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=R05xdlt97pe/ijbd4CsvgRrK3H0zhwdCFNuSbe6tD5xKdsTmrD9W4UCWmZVq/7G9j
	 inXtguiQCUbXXibB4KnH2J5ljgNUpz/Tu3LEUb74Dl8pu7Ym/bbiGSdHXrsYgU6L7x
	 dWnOAGypLXu3rwDjK9dIvj3+wnOOCDXb1jUUugyEBANR7nQ8nwcq2U7MBV6OR4dnax
	 +A6EbAbdURYNYmNwgEHXawdT3JnfgFCxjszQJum1+FGFDsumdwFeb7//fPO2hgSYWU
	 ishEv9Y/n/IV0oeEZ7W4bB5BNxIGYGUBIbvKocmzEQ+r65BA7XMez+qq9nswkMK+rr
	 nlfRkqfeMc9pg==
From: Danilo Krummrich <dakr@kernel.org>
To: Gary Guo <gary@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] gpu: nova-core: remove `#[allow(non_snake_case)]`
Date: Wed,  1 Jul 2026 23:07:57 +0200
Message-ID: <20260701210757.334789-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260612123401.2684025-1-gary@kernel.org>
References: <20260612123401.2684025-1-gary@kernel.org>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, 12 Jun 2026 13:34:00 +0100, Gary Guo wrote:
> [PATCH] gpu: nova-core: remove `#[allow(non_snake_case)]`

Applied, thanks!

  Branch: drm-rust-next
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[1/1] gpu: nova-core: remove `#[allow(non_snake_case)]`
      commit: 24d2581fd911

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for the upcoming merge window for the next major kernel
release.
