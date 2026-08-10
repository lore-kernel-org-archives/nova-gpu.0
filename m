Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2099E39AD3B;
	Mon, 10 Aug 2026 22:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786400662; cv=none; b=F9NctXMAvVaAM2pHQRjptwnClszdET1Ba8wEj57HxD0jNSXbuCbKT4OgfOJG+b40o3xLsbkONCodF2Ncuif0DpEWqs+E7REi3OVLky0L+1stqCfp7Hxw9kNpJUhdAftm3ajDg5jR0d5Bt4tMgY1iA81X1YOLQkNF/NHOzF3B6Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786400662; c=relaxed/simple;
	bh=c5teRNqTCwBmsRp6KfY4/U4W4r2oUzk4Bf/5/gdPplQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=DgYDcWDL/fHcPz0At1UEsG41t984ZtIqLbQhZXlt6V38K9nXPb6wFjSKG/9oW9RnAJvEkuxOIGPyzrj+sBhrssVL8T7LJrRAX70j6hPhvjTZ8sMCmTO2eK6XQ6hoHLCuj701pZYut5tzFqsm9+CTPeJygZlPBnpA0ppcBhlZ/cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GhbxCYa/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GhbxCYa/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E9EA1F000E9;
	Mon, 10 Aug 2026 22:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786400660;
	bh=c5teRNqTCwBmsRp6KfY4/U4W4r2oUzk4Bf/5/gdPplQ=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=GhbxCYa/bVp8EyR5yS9RiF9YdaRYpQh+cmKvn2Hm9z6VTs23J7/2i7FUkCLjUXAk+
	 Vq01S+07iAO6yI9j5D/5heCbRhh529UwmcZf/dFY/r/KOT2HKdtFAOSSBYihthpoVm
	 53sUQ96tJpbT8HNMCeIVPiYzeSbDCBOUMPEDfXi+B44XFsKYZG19Qzcfzjfc8Ze+pp
	 zguHO/llRh0MdFCrFlT1U0rbt3G9Q3fDuzdsSfWfqkc5g+ZlyMd5pjLxmvVsc3sU2i
	 cOT2dKWychwAopSo1WnlOTudMixJ4/F0/vyJR1hIbShjBSWoNZroh1NNgQc24MBHkJ
	 H0OVCzb2uzibw==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Aug 2026 00:24:13 +0200
Message-Id: <DKLM6J169QBA.100RAXAAOA9HO@kernel.org>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Yury Norov"
 <yury.norov@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Jonathan
 Corbet" <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-doc@vger.kernel.org>, "Joel
 Fernandes" <joelagnelf@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 04/12] gpu: nova-core: mm: Add VramAddress type
References: <20260810-pramin-split-v2-0-65a00b3c7309@nvidia.com>
 <20260810-pramin-split-v2-4-65a00b3c7309@nvidia.com>
In-Reply-To: <20260810-pramin-split-v2-4-65a00b3c7309@nvidia.com>

On Mon Aug 10, 2026 at 3:55 PM CEST, Eliot Courtney wrote:
> +/// Physical VRAM address in GPU video memory.
> +#[derive(Clone, Copy, PartialEq, Eq, PartialOrd, Ord)]
> +#[repr(transparent)]
> +pub(crate) struct VramAddress(u64);

Let's move this into generic code, maybe rust/kernel/gpu/types.rs? I wouldn=
't
mind doing this as a follow-up though. Will go over the rest of the series =
soon.

Thanks,
Danilo
