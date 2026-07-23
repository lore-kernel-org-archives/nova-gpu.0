Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46ABE3E9584;
	Thu, 23 Jul 2026 20:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784837379; cv=none; b=nIiRV4/PyhOts7vLdMW8Cr8KRL9WVoB5ROWEEsDY5krMob8xxvRlAfENL9UY8ROOOgV7AoywQeVH3zPBfGIIFROpYa0jIlvDcFwyhkff0/h6McBLtLaDl5Vr4Lijl6iOyw3mc17dA7AVC+zA5gLvcrdW54nY5B/Ur+qPSMy8JlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784837379; c=relaxed/simple;
	bh=IDpirxHa/6fs4T3NLiWrDLqkq4MF5x5c8ImmAUT5/bM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hESWOLzzifgEfs5Rw64DdkvyWW1vRrVYOmTHc1n3+nERblG3VN1IezMo06RU5exHpEqQpdKz2wUwSxkIWEIp23MLMKP1e9UWIllXr2m85cOpDZoT3E3j5gd4g9CYF1r4E9yQ6oKYay7rjhJCj1+uw1r/Mcdken6XVLcOkqisec4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iw60ZoQi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iw60ZoQi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3AD11F00A3D;
	Thu, 23 Jul 2026 20:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784837376;
	bh=MHicQjVDR/Fzc1uyzb0fVCPmZeJjLHF/HVKFRDv2zQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Iw60ZoQiU2SFXPQOTT56RkGQslM5B7MhN2n9Y6y04LgZH3FrVFsMOncRYtERGuT4m
	 7L/Oe2Djc2HpxD6SlcMbf48PCQ74ci79y3zZqPZwFaaqgRnwskkvrNM9Uxn+26tI7I
	 bqR+93nfPMh0CSA+NiVAXB8XmDileY2dfVNXy7dRtZiCCMCwh9b3Ouy2py2W23oQnO
	 g0EXk4/B5zMm4ZxAoMkERhBXxDAt6PVghZAWNd0enxMVHqBXKidmcwXBfFtbcXFn5q
	 5UoHKIzw5CMyEmEuk+Sxp3OEGR8Y7Lj50gYxygPSP60OJA60sf4NiQ72JTCCmwy5Ix
	 qVyh5hYSu0QCw==
From: Danilo Krummrich <dakr@kernel.org>
To: Zhi Wang <zhiw@nvidia.com>
Cc: dakr@kernel.org,
	acourbot@nvidia.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	jhubbard@nvidia.com,
	ecourtney@nvidia.com,
	joelagnelf@nvidia.com,
	apopple@nvidia.com,
	cjia@nvidia.com,
	smitra@nvidia.com,
	kjaju@nvidia.com,
	alkumar@nvidia.com,
	ankita@nvidia.com,
	aniketa@nvidia.com,
	kwankhede@nvidia.com,
	targupta@nvidia.com,
	nova-gpu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhiwang@kernel.org
Subject: Re: [PATCH v5 0/6] gpu: nova-core: boot GSP with vGPU enabled
Date: Thu, 23 Jul 2026 22:09:24 +0200
Message-ID: <20260723200924.3388236-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722073913.1807677-1-zhiw@nvidia.com>
References: <20260722073913.1807677-1-zhiw@nvidia.com>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 22 Jul 2026 10:39:07 +0300, Zhi Wang wrote:
> [PATCH v5 0/6] gpu: nova-core: boot GSP with vGPU enabled

Applied, thanks!

  Branch: drm-rust-next
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[1/6] PCI/IOV: Return unsigned int from pci_sriov_get_totalvfs()
      commit: 7cffd051ae54
[2/6] rust: pci: add sriov_get_totalvfs() helper
      commit: 6afbbc27f582
[3/6] gpu: nova-core: read vGPU mode from FSP via PRC protocol
      commit: c1cad6dfb116

      [ FspPrcMessage is small and short-lived; stack-allocate it instead of
        using KBox. - Danilo ]

[4/6] gpu: nova-core: detect and store vGPU state
      commit: 4d40a785fdb5
[5/6] gpu: nova-core: set RMSetSriovMode for vGPU
      commit: 1d8118c256f1
[6/6] gpu: nova-core: reserve vGPU WPR2 heap
      commit: e5b5de8e9ee2

      [ Use checked arithmetic to calculate wpr2_heap_addr. - Danilo ]

The patches will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patches are queued up for the upcoming merge window for the next major
kernel release.
