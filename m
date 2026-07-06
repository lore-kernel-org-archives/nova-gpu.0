Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24FE3B3C06;
	Mon,  6 Jul 2026 18:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783362262; cv=none; b=Df85E84MgAz001drWfyzrQiXffj4WAqOYZATlLgwqAoKH1rzXMe9maCtXsX4lT8RUmVGIOW4/JvBoQjEs+7xUgkqGTUXXOmhkeGs+WAqtxg1NohR1QUOvEBUCUz5QKg3sLutamYiXvcWvUp5RynFcm6kykrbgKMZ3PWwKcxykHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783362262; c=relaxed/simple;
	bh=2THaO/BA9vRIycAjFCTFh7sw3QM4VZs3uBZdtUPlQ/A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=KlWb0kkAz6+MXMXJWNCzyng24zbIVCH2/BPQTEaGFjiyhYtDaNsBzSlzB/MpqbYqzcm9cRjE/MnfQ9yXnoGRhU2RJD4BTAcjUtSWvW2EgmGctuCfKXB3QvogAIV5tGLWODFHSBUEWFwhNoHM5wHeB7c5G6Fin3zG5SH9qUtxuWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X0altrg5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X0altrg5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A5C71F000E9;
	Mon,  6 Jul 2026 18:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783362260;
	bh=K/KkssBkhVgVIh46vkgI/nfxUkz9E1mOUlteTTNrRQg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=X0altrg5cGkWWna0S88PwdclgEGysCeir7KByOyCtWwvE8QkaKpU1OXjsjAE+sHL5
	 8+S0cKpw4krOJB+UOUwSM6ythlk0vw5iDkkYrtesu5yv1o2dVyT6Bmd/sjWOLYNMdr
	 LSraJrEou3DMCPIKPw93IV0jLI0kRuISpKiQhFY80M+j0N4Cd5PvXSgDUM0LAEEpNy
	 4vsDiaITAqvhGB/GKfVx5lB3cndYQ9q6dfgLC3lm+r/6miX3dq3nRE5DK+QiiV5y4x
	 3EO4YQ8cR/pgGtok98JAYsJqfuemDpo9m42KB+gNOolV7It0M3CsU8vggfJceYu0XQ
	 dyci2uzFsk5+g==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 20:24:16 +0200
Message-Id: <DJRP5QO5JKVT.Y7LCZARVCWJ8@kernel.org>
Subject: Re: [PATCH 3/4] drm: nova: Add GETPARAM parameter to read the GPU
 chipset
Cc: "Alistair Popple" <apopple@nvidia.com>, "nova-gpu@lists.linux.dev"
 <nova-gpu@lists.linux.dev>, "John Hubbard" <jhubbard@nvidia.com>,
 "gary@garyguo.net" <gary@garyguo.net>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "lossin@kernel.org" <lossin@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "aliceryhl@google.com"
 <aliceryhl@google.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260706053413.154135-1-apopple@nvidia.com>
 <20260706053413.154135-4-apopple@nvidia.com>
 <59948bff927bd4ad3af5fbe68d5d5e7565c5f729.camel@nvidia.com>
In-Reply-To: <59948bff927bd4ad3af5fbe68d5d5e7565c5f729.camel@nvidia.com>

On Mon Jul 6, 2026 at 7:35 PM CEST, Timur Tabi wrote:
> On Mon, 2026-07-06 at 15:34 +1000, Alistair Popple wrote:
>> @@ -38,6 +38,7 @@ pub(crate) fn get_param(
>> =C2=A0
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let value =3D match get=
param.param as u32 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 uapi::NOVA_GETPARAM_VRAM_BAR_SIZE =3D> pdev.resource_len(1)?,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uapi=
::NOVA_GETPARAM_GPU_CHIPSET =3D> reg_data.api.chipset() as u64,
>
> Can we assign these IOCtl values to match Nouveau as much as possible?  I=
 think it would make
> everyone's life easier if we could use the same user-space tools/librarie=
s for Nova that we do for
> Nouveau.

I don't mind using the same numbers where it doesn't matter too much, but f=
or
this to work, it would also require us to retain layout compatibility with
structures, semantics, etc., which I think we should not bother with at all=
.

Let's build a clean new uAPI, it will get messy over time by itself. :)
