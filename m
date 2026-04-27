Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEAB1A262D;
	Mon, 27 Apr 2026 00:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777249187; cv=none; b=FE9rcLH5c/qb4vvVWWg0GNAnrI1n77P+6SBxqzA97Hx62lNY18aDOovlIGS+S0+IRJN3jJaC2sjBRjJuAwJQkXEnHxK63l0NIkncI3sXvL36B1I73gdUiB7GEDBiovvQ/1CZQ5rFaGe/zJAeObxhJM6a1OcJimHRQDNZ8OpYswE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777249187; c=relaxed/simple;
	bh=pQcztVIYnB6HM81PuBatMXyzSIxW/tn0+1fHdpnZNBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=COsKkJjjIwWq+iKKg2BiRgbp8dD1Vrw/UJ/MUWKt89+IefdfvE3+UHhbaJb106G4q+U1UCbNiuI9Q5nFMAtoysHmYCgHUAJHgBO0BJsnJq5FudICEkcGFCae5hAQdIdUZevHrSNGPglEkRVaeZFR2yixAndWv6SluByPB/7gKbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cQanYPIp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cQanYPIp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E56B1C2BCAF;
	Mon, 27 Apr 2026 00:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777249186;
	bh=pQcztVIYnB6HM81PuBatMXyzSIxW/tn0+1fHdpnZNBs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cQanYPIpp1Ms8FDiRaJyeabJVSVixFFsvXNPYTxrgUObPgVJkYiGLOXjrTwIOvxtw
	 bRQab7txEy+4WvLZYDT0VyqH/k2sWU5Td1a/vACQFX/M+wfASPEUGA9zUYjfZLNTR+
	 08b6Q5FosCD6frDh1HLoO/Sl8w2alxh2H1vyYFfLaXBtDtPVzmnDY3+o5dI/RDSPUI
	 rafJIedYMVrDxScxG7Bs9up+gpcCXDuzRHNnVOxBteAIaRLWo5zV31HiuMZiHjtYJB
	 miwdP87OsDv3QVqz8q/xG/bMYZbLGYc94DLy91HxswN8pIGtQxT03G+hTUXwof0c4w
	 HwzXsnQ83iagA==
From: Danilo Krummrich <dakr@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: acourbot@nvidia.com,
	jhubbard@nvidia.com,
	ecourtney@nvidia.com,
	joelagnelf@nvidia.com,
	apopple@nvidia.com,
	ttabi@nvidia.com,
	zhiw@nvidia.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	aliceryhl@google.com,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: nova: update mailing list
Date: Mon, 27 Apr 2026 02:19:34 +0200
Message-ID: <20260427001934.1562415-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260423124649.38793-1-dakr@kernel.org>
References: <20260423124649.38793-1-dakr@kernel.org>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 23 Apr 2026 14:46:35 +0200, Danilo Krummrich wrote:
> [PATCH] MAINTAINERS: nova: update mailing list

Applied, thanks!

  Branch: drm-rust-next
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[1/1] MAINTAINERS: nova: update mailing list
      commit: 15e8bae5d930

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for the upcoming merge window for the next major kernel
release.
