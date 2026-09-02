Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC6A468C0A;
	Wed,  2 Sep 2026 19:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378163; cv=none; b=QL9L/AOtFTZObsRlfOm06v1vG/neUu9YNXbhImFT6IGw9777DXtI+jDkDRIUM0zmWRn8O1OZRcNXjbO1WpCNRKFvj9Huc5YwzPYQAIZ5ZPK5cinKpHdbPWP6qTM0fnZhI5AxegklwotGOU9jb+nkqzlbB1FHAvSzlxMEOQTdKTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378163; c=relaxed/simple;
	bh=QI6DSgZHTMO2ZGXb0zdh14O9QI0CO32Juv51tWt/9y8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=giHm255a7Ql8VJa61GGpdEgT/+OGCbGaRu5+NDcKfqbKXvE3ABC/Z8wp/3lhFMRu+L2ddVTLrsHKgAJFmx95QShwR35bXlR9FcGi4d4zVhb1ZgnjziNMdRe7jc9HKm92SxrW9p22a4E0b/NQDfsH7URUZXYqPbl+nnKNziRoBqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IM2qHrmV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IM2qHrmV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA31D1F000E9;
	Wed,  2 Sep 2026 19:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788378153;
	bh=QI6DSgZHTMO2ZGXb0zdh14O9QI0CO32Juv51tWt/9y8=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=IM2qHrmV+36puV+WA/mObf99k1bRtgeJzU4sYcMCtLvFoH71rdiin537e4m0y0MhH
	 9Dwgctfpz1cZm+bdvg12gr/3RhGOsCVSVIz5BXp/T9qH/KirZtF9KIm4ghrl+VMa6f
	 aIGZ5c0bwPIbSYcarHubZfnK+7Cu94t1EwbHHI8gNKl8kwUHVtjP5MAnKUJhJLjn5x
	 Khpj5XipvsklrSmk5edKhzGd3rcT/i0NkIS8TZm9WEQVEh8Y3WLhINd9xydnWoVdh+
	 IZBIyObnCuQUI+ZFX6rmHxO5lyFiS4+HyG1whsljG3GUJ57s1iROfa3DAWc5+Zqo35
	 hQm5l+4WitM+A==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Sep 2026 21:42:29 +0200
Message-Id: <DL5357XTUJUG.R3WHR5BJY4X9@kernel.org>
Subject: Re: [PATCH v5 05/11] drm: nova: Add an info ioctl
Cc: "Alistair Popple" <apopple@nvidia.com>, "nova-gpu"
 <nova-gpu@lists.linux.dev>, "M Henning" <mhenning@darkrefraction.com>,
 "Alice Ryhl" <aliceryhl@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Benno Lossin" <lossin@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, "Eliot Courtney" <ecourtney@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
To: "Dave Airlie" <airlied@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260828033531.1117754-1-apopple@nvidia.com>
 <20260828033531.1117754-6-apopple@nvidia.com>
 <DL373JA1ZANX.21L51RTEUQ2UG@kernel.org>
 <apZCTUYiN5FHCkCm@nvdebian.thelocal>
 <CAPM=9twQxnx5DDkjwXWi-vXM4kqUQQdPaL+=1ASS0tpf2GmnYw@mail.gmail.com>
 <apZbKc5xMQ1yTBTu@nvdebian.thelocal>
 <DL3SXIIA4FID.2V3K5YC91RM3V@kernel.org>
 <apetgjQ9zWpJATj3@nvdebian.thelocal> <apfJhtr6BpMosz1q@nvdebian.thelocal>
 <DL52TB47MFFY.CICXD0XQ3T5K@kernel.org>
 <CAPM=9tyXx=BVy9E6PZNwYwab0SWWpFOFgX2jktqPVumiqY2viw@mail.gmail.com>
In-Reply-To: <CAPM=9tyXx=BVy9E6PZNwYwab0SWWpFOFgX2jktqPVumiqY2viw@mail.gmail.com>

On Wed Sep 2, 2026 at 9:38 PM CEST, Dave Airlie wrote:
> On Thu, 3 Sept 2026 at 05:27, Danilo Krummrich <dakr@kernel.org> wrote:
>>
>> On Wed Sep 2, 2026 at 9:05 AM CEST, Alistair Popple wrote:
>> > On 2026-09-02 at 15:21 +1000, Alistair Popple <apopple@nvidia.com> wro=
te...
>> >> Ok, so just to double check are you happy with an accessor to return
>> >> gsp_static_info as well?
>> >
>> > Still interested in your thoughts here though, just to avoid churn bec=
ause I'll
>> > probably pick the wrong answer :-)
>>
>> Yeah, exposing that for gpu_name() seems fine.
>
> Though userspace doesn't probably need this, but we could I suppose.

Yeah, it shouldn't be needed for anything, but I also don't think it hurts =
and
it could be nice to be consistent about the name throughout the different
layers.
