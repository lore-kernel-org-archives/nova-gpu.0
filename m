Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D67330DD00
	for <nova-gpu@lists.linux.dev>; Mon,  5 Oct 2026 19:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791228857; cv=none; b=K+Ma/ffpK7f4WiTella9FVmHoC6IDQV4o/GOQtRbsj0E8O1zCFDfETcrn2McBYbBvOV7zgKAsMIrwHm7Mg91DuZZwqLSbJH/l2hD4fIqJLrnmlMhUVo9PhAQxMupKKaUmu3zfAPD1tLtLPgA++da01KB8meK2bZBReO+Y8hQ9Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791228857; c=relaxed/simple;
	bh=rYUDjH2sDXIus1LzUJFlCT5dgPzkcD4Y38TjxN9p8KY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tXygSxWWta3mNx53X5bOVabrGuhV6LTNiW9azwOeAeoBKWtyu73mL4CdgkhRJvW+cyqk1Jb7AtzN7ZFvPwHOxjAAU/IWJNldbo1XKomFE9GP7PYal7CKMJmrZnpePJ/jv1/WuyLOBWzJ0Eu1bahiOjkOdM2Yqp46suWK7gXdUs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kA6pMauX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kA6pMauX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB60A1F000FF;
	Mon,  5 Oct 2026 19:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791228856;
	bh=gDFT2yZzDGeZYymSPwekJ7FbvmPKc+UT1GuzyaabfV4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kA6pMauXx3Gc9gfQ2ST8ypnmG2GV+jn1PT8qcSpBO9Q37Sv+EN0f30JpY1qUg2EsU
	 /8ifPWyR2NZu7PX9Hb2ksdnVHvmD6jZvKA1+yHYvchxCY++fXqL4TbxfHmOW/JF+tw
	 A1opD+0fXv8mDE7KiHkeCrkTOh5qsoRvGB5wac+g558vo0fgYVLwb28kSPUKaA2AgK
	 Dn0P7YIsBf/VifxU/ldt0onkQbEbpG1HNZMRW2AwcyxySkrKKFyMWCTz5YoGTIBeWk
	 BvuSm2QudwSx05KtyCnizaod+w78dwNUVNRNOwLNlzX33OC9WoqEPo3IVZ8ZUf0xtW
	 8ECr8KxFWmk7w==
From: Danilo Krummrich <dakr@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: airlied@gmail.com,
	gary@garyguo.net,
	acourbot@nvidia.com,
	apopple@nvidia.com,
	jhubbard@nvidia.com,
	ecourtney@nvidia.com,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: nova: Move VRAM BAR size query to GPU info
Date: Mon,  5 Oct 2026 21:34:07 +0200
Message-ID: <20261005193407.26849-1-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260927142258.1260711-1-dakr@kernel.org>
References: <20260927142258.1260711-1-dakr@kernel.org>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, 27 Sep 2026 16:22:09 +0200, Danilo Krummrich wrote:
> [PATCH] drm: nova: Move VRAM BAR size query to GPU info

Applied, thanks!

  Branch: drm-rust-next
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[1/1] drm: nova: Move VRAM BAR size query to GPU info
      commit: 04476103b7bc

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for the upcoming merge window for the next major kernel
release.
