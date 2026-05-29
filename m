Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E75352030
	for <nova-gpu@lists.linux.dev>; Fri, 29 May 2026 01:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780016453; cv=none; b=mSovf5/nDcFrsRqYJFFaNvcqi5i6Zivn0Yq1NaiXJ0h2ePl11z3cCBeU08JS3wBE4i8zyIiiBwhfazyzVkMmQEzd8LhTQj1lifaUuh2pkUw/qvCIIMluxotnBfk0DFRThhSuemJPLuUM2J6vqr3k0ZY3mdQ139Jxj50Fy2IGpZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780016453; c=relaxed/simple;
	bh=PBRO3etB7lPkL1yRU0UjynsOCXgaIULKhqql2Fq7OQM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KCG+LC43ln7C/V2oBBZPQpy7+CGCsTFu/CVkypaksezzeOVXm0BpXMY0LEN1E2hC8pspyngPnROINLypfcuO9/G2+yN2xeJjpOtfohydwDAU5EypaZ+O1Kf77sxOcO548k5mTZsBuxQTjOdHCqpsOpsvpFv8ldKXyHVhoO9/n38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P/SWR753; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P/SWR753"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780016450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PBRO3etB7lPkL1yRU0UjynsOCXgaIULKhqql2Fq7OQM=;
	b=P/SWR753vyNJQ6KMRgt/BkWurGoeEtvUt97RkjoYNX2W1GKBgUv/ncfDvGudt0Vurjs0uu
	rUjVGXL5DWapsyYH/nPRP5UqaTD5B3Aa3c96sjhlytQGTxkeo/tOrKcg0y2egJM4DECReR
	9le6iVXqGWayx7I5nDNulm6TGSJruS4=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-32JNAk_hN-OQI42LIhssnA-1; Thu, 28 May 2026 21:00:47 -0400
X-MC-Unique: 32JNAk_hN-OQI42LIhssnA-1
X-Mimecast-MFC-AGG-ID: 32JNAk_hN-OQI42LIhssnA_1780016447
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517288c4ed0so16121431cf.3
        for <nova-gpu@lists.linux.dev>; Thu, 28 May 2026 18:00:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780016447; x=1780621247;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PBRO3etB7lPkL1yRU0UjynsOCXgaIULKhqql2Fq7OQM=;
        b=spW2wqaveNycqhgDXofixWtzdvOtveXUyfDOUP3ry6AE6abdB2xWZPgpu7VoeRXdsn
         2Zlye2VxnimYATkgCcJhnhQqAixtxZSZywZCEmK6ccoPYgdExNMgubljHjgAf/riL9s6
         UBlZcK2WgiW8Hp26Vb9kGGOJXa/wLOzr+zf+Ke6nUuGDnQIihDFO/kNKk4b5Bkkx1X1p
         0VIHLwiw9ki+A/k6OELHnWYaTJgnYIWwdZytU1u3UlXusQCnGLoBbxcgjGUDM2UWukWf
         yoyrC1XB2kHW2PjIi+7nQDv1wl19pcff7vzMtqwsqY959SCT5TmtW+0fTkUd3+7i75PG
         4ThQ==
X-Forwarded-Encrypted: i=1; AFNElJ/X9wfIfty2XvV2F0noC5rj/HRKxAVXjtQeovHEu5pD5/JobxXe5rzKLks/FUJO8eF1etQ2PLC8GA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwMl6VFzWcNCvBGcOUJW7xenx70MUF4rHNqraqCbH8bO8UEp3eL
	N3WH56pnaiW1xJr8AvkHdat083tyUpM5Rud7mRHGA621DkEcK0XcZWeRCQyPP5ItJcvRzksgkBn
	/sQ6f/ZuMb9FUVxsOm5wHZ54L2V0HJNFCqRSdBrZJqjilw5L18uvod4pkMTkK
X-Gm-Gg: Acq92OH+jjk0sS2ywlFWb+vKW5Gv3g1cpxwTBJunXioZbPiUnIZDhqYt//T7Jhap+Ts
	mQHiC3VWhNsNiBjR9t29rWQVkmk6BMBiC7SFNpd+YKFzfNTqCwM0iBy+BwlcVC0tk8h3SWh7BHf
	h/IVObAbW808XJI5fEuMBKfQVcQJsnzfclLDYbYODG+sve3NhDFVBlAPwFYhDnaWy5CONs6HrXb
	XEM9LyGQMLNN/aaj3pADOZazalQeQLOxuUI8PrKfrpy7lCSqpYSz3KOJI/58XBRwwAWW7y3DFTP
	4i1oJG6RMJbasnuw6cZB9Oz4OzdEFNn3aPa51hUofXLQPvw0RysZ7jG2RSj/CQE0D6l/N9j977h
	3eZCfe6aBOuazAcO1pGPgbReW/cwD
X-Received: by 2002:a05:622a:1b2a:b0:516:dc50:a01a with SMTP id d75a77b69052e-5172dc1e44dmr12443111cf.5.1780016446505;
        Thu, 28 May 2026 18:00:46 -0700 (PDT)
X-Received: by 2002:a05:622a:1b2a:b0:516:dc50:a01a with SMTP id d75a77b69052e-5172dc1e44dmr12441761cf.5.1780016445788;
        Thu, 28 May 2026 18:00:45 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5172e9a5034sm5068741cf.6.2026.05.28.18.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 18:00:45 -0700 (PDT)
Message-ID: <066ef2f147aa7b568d31983b8ba4427c3eeeaea4.camel@redhat.com>
Subject: Re: [PATCH 3/6] rust: drm: Add RegistrationData to drm::Driver
From: lyude@redhat.com
To: Danilo Krummrich <dakr@kernel.org>, aliceryhl@google.com,
 airlied@gmail.com, 	simona@ffwll.ch, daniel.almeida@collabora.com,
 acourbot@nvidia.com, 	apopple@nvidia.com, ecourtney@nvidia.com,
 deborah.brouwer@collabora.com, 	ojeda@kernel.org, boqun@kernel.org,
 gary@garyguo.net, bjorn3_gh@protonmail.com, 	lossin@kernel.org,
 a.hindborg@kernel.org, tmgross@umich.edu
Cc: driver-core@lists.linux.dev, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Date: Thu, 28 May 2026 21:00:44 -0400
In-Reply-To: <c393d06629007dc9fe76224d7b8a594b10c07edf.camel@redhat.com>
References: <20260506221027.858481-1-dakr@kernel.org>
			 <20260506221027.858481-4-dakr@kernel.org>
		 <b1865396f13f67b600f3548caa8ff907cfee9403.camel@redhat.com>
	 <c393d06629007dc9fe76224d7b8a594b10c07edf.camel@redhat.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mnEGL6g0IHqJazWU7iqFU1vL7x-z1uqCDW8OelzYWiM_1780016447
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-05-28 at 20:15 -0400, lyude@redhat.com wrote:
> FWIW: now that I've noticed this, that might simplify things w/r/t
> what
> KMS needs here from DeviceContext and allow me to go from modeling
> DeviceContext around 3 stages (Uninit, Initialized, Registered), to
> just 2 stages (Initialized, Registered). The purpose of having a
> separate Uninit and Initialized had been to workaround not having
> access to `drm::Driver::Data` when a driver performs an atomic commit
> before userspace registration, which would be a big ergonomic issue
> for
> implementing a lot of atomic KMS callbacks.
>=20
> But if that's not an issue with this patch series, then it probably
> makes more sense for me to respin that DeviceContext patch series to
> reflect that since that simplifies things a lot for the KMS side. For
> your patch series, it just means you have to replace "Uninit" with
> "Initialized" in the next version.
>=20
> I will send out a respin with this tomorrow after working on
> respinning
> the gem shmem patch series, since that shouldn't take me very long at
> all.

Actually - after working on it a little bit more, I think having the 3
states (Uninit, Initialized, Registered) is still going to make sense
for KMS. So, I probably actually don't need to respin/change the
DeviceContext series from how it is right now after all! Sorry for the
noise :)

