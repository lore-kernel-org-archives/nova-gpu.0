Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9983304BB2;
	Sat, 10 Oct 2026 21:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791667656; cv=none; b=kEclKTKninWN417D5GBtsPGkutdAPwZ7lS5OUueD2jUm3lDyQlu17BA2OR3+Dnn0Nppw0Gw48F+hDbMyiEliR5n9zXwdvg7z9A3A3ui+2rt75KivJfaURzz8gHEeEtl+c85wO0SC6SZ+gaQ52P6MNgV4YjDByLhz3LtBgKU2JaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791667656; c=relaxed/simple;
	bh=RHwNlLI02lKICfNUC34s4QhlAb6JwzSZndXwUOfDtGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TluX2Xo3R8LRghBGHUslG1kqxf3kuCbjXI5dAiejmEKl5mMsjQF+zF5KvSJLBhcLFpdvh9EtfEX3ZFM5DRkN0QbBQoBLz+g62kYnVGrJM8Zt89GvYHlYfXcMQOQg4PeuX/s+3rxObf9uoF5UxfVfv4PBA5CqPp+/iyt2GnXAZVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IOU1OmL3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IOU1OmL3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E47691F000FF;
	Sat, 10 Oct 2026 21:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791667655;
	bh=aBOErNgj41UkSd+ckoD6Tnh7MLen1S5T/m2ZSiZ/A58=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IOU1OmL3weTIU0MAQOnGsqgyCc1AGFSvDtAO3qreXjJ43hAx2tKhZR0qKM8yqvlZq
	 cO7bQR28+IbL5qkK9MCFKPph6e5p6+bTYbVBqMtiX8GFlWT9dqpYR3cC19v+2jN/Vq
	 Kux0ZN7GgUP9zcgJXqhaP0WlsKMwG6BX/RGJrJJEcs4iHMXcYrx0OU6LKE1HxRQJ23
	 xOFKG/5rser1Ar6FA5HwglslQu5WB/YmN4mYD06Y0WLAPkBwwPMe0BH1FAQ9eNHg95
	 YQfAq/p1yoA/QcIFyEoNnh2RrCj97VD17UXbZ+q1LksPhTQEPgnHBSPvQxW9lKBpFd
	 Iq+HOqunULTPA==
From: Danilo Krummrich <dakr@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: aliceryhl@google.com,
	acourbot@nvidia.com,
	daniel.almeida@collabora.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	tamird@kernel.org,
	work@onurozkan.dev,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/2] rust: drm: Return impl PinInit from drm::Registration::new()
Date: Sat, 10 Oct 2026 23:27:29 +0200
Message-ID: <20261010212729.590021-1-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260929190024.2248099-1-dakr@kernel.org>
References: <20260929190024.2248099-1-dakr@kernel.org>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 29 Sep 2026 20:59:30 +0200, Danilo Krummrich wrote:
> [PATCH 1/2] rust: drm: Return impl PinInit from drm::Registration::new()

Applied, thanks!

  Branch: drm-rust-next
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[1/2] rust: drm: Return impl PinInit from drm::Registration::new()
      commit: 700eed1364e8
[2/2] rust: drm: Remove unused flags argument from Registration::new()
      commit: d511064b2e73

The patches will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patches are queued up for the upcoming merge window for the next major
kernel release.
