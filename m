Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817873FADE5;
	Mon, 27 Jul 2026 11:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785151183; cv=none; b=HvTnHentO+0rHuBk8X38FkeoHA36G/JQdw9QWPqe4nneoaSwbAEh8/qR6ecDnhDaQXiEU7JZlJ7K072PE6J6N3KX3/Cg8b/efsK4fJQhx6sWIJzjKLoYcKtNs2g8vrIyZWqys6pK0b2Wnnyfqym8WZBaOwifpJ7NA3S+Y9ZTvrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785151183; c=relaxed/simple;
	bh=7rois3tyGDgFpZ0VN8zK1c2qDI/P8DN5GT/B5hSQ3oY=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=MYXBqvjYfLMkKukm5u2Bz2CbByNbqCTE52J4Z6/OZfx1ov88mqEd3RpYsR4HJEypw50F8tQaAGCQ5Toja+ibdCMu5/F2HiRi7+KQj3sy46+X0MoJyYMgHIE3Bcpy1nvMi67ucuDLSh99t9pNrQOoeYWWLD15eJRMaMkmCdvK6ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I3UPbxWU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I3UPbxWU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D3F91F000E9;
	Mon, 27 Jul 2026 11:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785151182;
	bh=7rois3tyGDgFpZ0VN8zK1c2qDI/P8DN5GT/B5hSQ3oY=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To;
	b=I3UPbxWU1XdEljpuUjqV3yT8wIS0sMu78+u36ojs8Kr7oKYe/Ujz/RHR5Tvql+FlP
	 YxLS180x7vzMraZJ69tWAgCA37stT82HoFjQl/yebuZut4FGGzI7S5I2wMUdZD4ICJ
	 S05YncKFIdP5FCUWRC30pssOuLw/4NgeKphHWM/kTCskdSzxcV6mAqIsGFkWzkemxz
	 lwoRTOeJwFOHYHRycIX1b5YQGXzVfXbBQnBp37aypNQFViWKvdvcFIp87RHUtTNuHT
	 VPnK1H/ZHxr9+ghzNe6xyfHhX1dM8XGAKozlFKV5HRn+9lZwLpujtWraYFjnjZDqdd
	 mztm+26G9A+NQ==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 13:19:35 +0200
Message-Id: <DK9BA0QUVUGT.2ZB6EESQOXCS3@kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 1/2] rust: add functions and traits for lossless integer
 conversions
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Yury Norov"
 <yury.norov@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>
References: <20260727-as_casts-v1-0-6ea704ff25d8@nvidia.com>
 <20260727-as_casts-v1-1-6ea704ff25d8@nvidia.com>
 <DK9A6KGK5JQD.3U23MBEMSAXBK@garyguo.net>
In-Reply-To: <DK9A6KGK5JQD.3U23MBEMSAXBK@garyguo.net>

On Mon Jul 27, 2026 at 12:28 PM CEST, Gary Guo wrote:
> On Mon Jul 27, 2026 at 11:15 AM BST, Alexandre Courbot wrote:
>> The core library's `From` implementations do not cover conversions that
>> are not portable or future-proof. For instance, even though it is safe
>> today, `From<usize>` is not implemented for `u64` because of the
>> possibility of supporting larger-than-64bit architectures in the future.
>>
>> However, the kernel supports a narrower set of architectures, with a
>> considerable amount of code that is architecture-specific. This makes it
>> helpful and desirable to provide more infallible conversions, lest we
>> need to rely on the `as` keyword and carry the risk of silently losing
>> data.
>>
>> Thus, introduce a new module `num::casts` that provides safe const
>> functions performing more conversions allowed by the build target, as
>> well as `FromSafeCast` and `IntoSafeCast` traits that are just
>> extensions of `From` and `Into` to conversions that are known to be
>> lossless.
>
> I'm okay with having u32 -> usize casts and usize -> u64 casts, but havin=
g
> usize -> u32 and u64 -> usize casts like this series do is worrying as it=
 can be
> misused from drivers that are supposed to be supporting multiple platform=
s or
> core subsystems.
>
> Pointer-size dependent drivers that need these casts should define them l=
ocally.

I also raised this concern in the context of [1]. On the other hand, it is =
not
as if this can "randomly" break with exotic or niche kernel configs; 32bit =
vs.
64bit compile tests are well covered.

So, as long as we are explicit about it, I think it should be fine. Maybe w=
e can
export the non-portable ones with a different name?

[1] https://lore.kernel.org/driver-core/DK0BPAHR8IS3.2KLSLH7K448RJ@kernel.o=
rg/
