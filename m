Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D345496915;
	Wed,  3 Jun 2026 22:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780527177; cv=none; b=e/Ogpdz+qE44tqEPnJPV0Tl5OxKfJXgyCPr6i2uZVcJmYIYgyyfsk3vD66HVOc3q3acf2rMW25y2HhSNgn2E2hvNluvv4Y+xYCa5L1s3Sec02XQAveEg/cIeovaywGZFw/pX3s3VH9IuigyMXlYESmBJUYjADNqKssEgsDuVaX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780527177; c=relaxed/simple;
	bh=OgCNFxxXwuGUo/E+JAiOytz6Q7YO1Abq40EKUvt3QEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rFnPge0lKdGsSrVlpD0T/5aYQq3+t6VnAIRJNk6uPI0EazpZg0SpKVLQwckNd9Z5FLjsMTvhzlPAUrEXnxDMHNjNjyBRkva2zunVKYl7zKm/gk0+63QV5TunD28PjHByhdJ/puyGb0G6Tt6jSOmnCdYDGAcn3AA4TqwFNkptrI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NOJpCWW5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NOJpCWW5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6169C1F00893;
	Wed,  3 Jun 2026 22:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780527174;
	bh=lr2rNHkX39BthmBN26RYq5EGbd9Vpj+dbof9vb9JbBM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NOJpCWW5S+zR1CjgarInVOSGbK1POCG8KfuAmZVYNWnZdTknulf39I5hVMeBffJI9
	 4F824DNc5BetasTq1PRRP6nGgxBhzmWiq9rxLCzKtlis+Yc2L5epsNyh2jgw2s1hn1
	 NcYSbO1nqBDfX1NpOimzsuR/1BlMxM/lxhS7kW1c4hWlsgwixMYUiIVjv/12oZMRiv
	 vVkiXKmHsfkad+bDDbKOkLP9KgDkZSBakWJyn1tG73/5cvX+STRX/eifsPIp6fof4E
	 EyFrCQCxwKF9MzYce7a/Z65oIckBVZfutQYW4di8ewUjgzraqglJSQFmINMHyWd8rg
	 xZUbIf6Kl/+4Q==
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
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpu: nova-core: move lifetime to `Bar0`
Date: Thu,  4 Jun 2026 00:52:48 +0200
Message-ID: <20260603225248.2604794-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602170416.2268531-1-gary@kernel.org>
References: <20260602170416.2268531-1-gary@kernel.org>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue,  2 Jun 2026 18:04:07 +0100, Gary Guo wrote:
> [PATCH] gpu: nova-core: move lifetime to `Bar0`

Applied, thanks!

  Branch: drm-rust-next
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[1/1] gpu: nova-core: move lifetime to `Bar0`
      commit: 99676aed1fec

      [ Rebase onto latest drm-rust-next (Blackwell enablement). - Danilo ]

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for the upcoming merge window for the next major kernel
release.
