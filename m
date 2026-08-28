Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D5125B08D;
	Fri, 28 Aug 2026 18:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787940723; cv=none; b=E95G8FkWfPmtAPKiKcEFKUeqfAL+aFncCWc/f0yLfj7wIsERndrP8HzMiUxKFULPXB0J/hSXEZXLTKj0ZAG7i6Duu5MAUsIwQ75S02Bq8oPoPO255IaMYQTKWAkW1ZfTNHP9Z/YYx3v6Jn3GocMJT0EjGrq9To+Wdp6NwwrPzfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787940723; c=relaxed/simple;
	bh=enYrTIiUDgLZ6qrNsLyru4eCF8JD5x+/rIFCtu+nnmc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=c3pDiECER4Xdr5DsA75GVUKeTZBPlqjdqM2x1CdQqyUsUvHG7JZ+/1VevkQ77YjOQOpXDsU/QwEv1uaCU+z0p0rJuGkKiw6xV2kMVo+YZk5OaogrLTiPmPhZgANwMmBcK0zbmlbVSuzrCZxvt02tNIxCVFL4Qg1jFlGVSd5By88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZHlxmVsx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZHlxmVsx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 929A61F000E9;
	Fri, 28 Aug 2026 18:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787940722;
	bh=enYrTIiUDgLZ6qrNsLyru4eCF8JD5x+/rIFCtu+nnmc=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=ZHlxmVsxGRgrs0bL2wgqPL1SSlXehSQyaRk6Ooy1l1d8UwLm8hydyBYafnj8GxqnD
	 ksW9e9MB39mMsez0Q8xGMqY7PPM0H56VNXh+yexDQclRzDaeuimbAn0vyLnuWr5aas
	 44cYWTZFiIA/6QBOUYKrBU6JdFl7dfh1yLpjEqXFHdf7LiMqQjms6cWmztOCsFj1wH
	 5SZwf7i07eU9s0FYrtiJPNxO5tG98fb8H6D2QmfVsxfmYlA2O2n6DJDultTNtGTHjU
	 rMMOCUO4FyVGLpzA8daSZpGHXLqF0wnNBysjqDTadRfTUDf2RTnJ+KX/AMDpqoyAB6
	 PzDu6VSrhDgsg==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Aug 2026 20:11:56 +0200
Message-Id: <DL0S35VSVSX0.3KQH490YEZUR0@kernel.org>
Subject: Re: [PATCH 2/6] gpu: nova-core: add NVKV encoder
Cc: "Lorenzo Stoakes" <ljs@kernel.org>, "Vlastimil Babka"
 <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, "Uladzislau
 Rezki" <urezki@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
To: "Eliot Courtney" <ecourtney@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260817-b4-nvkv-v1-0-b84db5e84b67@nvidia.com>
 <20260817-b4-nvkv-v1-2-b84db5e84b67@nvidia.com>
 <DKT2C9FT6IBW.3L5PJN1J8IVLD@kernel.org>
 <DKT2NSDRJXYX.1S0H8K3Z75QVK@kernel.org>
 <DKZSNG5J5UA8.12HFHO9KURG0G@nvidia.com>
In-Reply-To: <DKZSNG5J5UA8.12HFHO9KURG0G@nvidia.com>

On Thu Aug 27, 2026 at 4:25 PM CEST, Eliot Courtney wrote:
> I sent the respin of this series using your EncodedStream idea but I
> think I should add you as Co-developed-by. If that makes sense I will
> add it plus your Signed-off-by (I think that's the right process?).

Sure, if you think it is justified, please feel free to add those tags. Wil=
l dig
into v2 soon!

Thanks,
Danilo
