Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E269D379ED4
	for <nova-gpu@lists.linux.dev>; Tue,  1 Sep 2026 04:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788238448; cv=pass; b=DUiDUbNGLM+mcxW0BkahTPrw1U8C6pzrztXY2CMToXmxCKlnx36ES7jHqXagceDtNCrDUAP/mRaclTHVt92HIbtPliJP3sMfYjIjd5uSZ3aJa2z6RRvuW2lIa3ramFGJI3UJN1iccqF8Qh5IHHv+NWwg4ZgW4QifITMynNKuh/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788238448; c=relaxed/simple;
	bh=8SuycrJ6e1WFHR/TNYgsJOBfzYu56DYt41F/4NfeqAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lSuMSh+83GdCNI9MIsiqfCVoWW/TU+ZfZQLKA6xc0eXajaVn9LSPbNEp36Qx6vD1kh6a+8jx0MjYJKAJrMmmp4jvUvVHwJlayNJCJCv91qZsQGnlttTDiZc6p0NS+PCDWrYlPWTBnIlc7jmNvRNdF2JvIRHUx+l866MyIB2207E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y4KCfyX1; arc=pass smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y4KCfyX1"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-90cd4631090so7496306d6.1
        for <nova-gpu@lists.linux.dev>; Mon, 31 Aug 2026 21:54:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788238446; cv=none;
        d=google.com; s=arc-20260327;
        b=GBQvqP+sNBSjkuYvg24nX4Zchfwn9IWkP9rGNX9piplYK40u+tbre+6D01Igpdeg/w
         al/K60AhIveeR7T5BAKiN+23J7nh1ensqxxJy4yP6QIhtCpDwbAijq+OUQmU56/ACZB7
         VJW2lItcHtpJIuoKmgrcT+DA+D0r7MGVfLuqzNBMCktJzUVAjFwMjFkpswEUpK2hmRbd
         O9aruD5SOhTTnAhpcBazLHWFXZFmh0HKvJlb0z9Bp9EXwOlq3h6x4JQZTlVob3ld9vLV
         +5NtmVT5u3iltf4rdExT2s6vANcu21J4bnPNueH0TJK0eU5tomXv8kS8lgZ/8VCwIFx9
         MiiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8SuycrJ6e1WFHR/TNYgsJOBfzYu56DYt41F/4NfeqAU=;
        fh=RpoQ9q3ZsrE+aanRJf80pYw4m6D2tSTY2wWoqRhZpFs=;
        b=VU5pIHH1NpSkCVoSQSrT74f/JY5Etl9t/GOl6/L7mbbUB5ADSsL5YmRf7yZwJ2ErLv
         edjk58J0iqDPlGvJzIOsclRG9rrFjHD7MK54LpOCdWusZZwtNLRhaC7statmOj+9cGmp
         YrBgaE1agY7Q6qtr8metrfo2v71KVaNprh+WOsfmvDKlLNdnKTu5XAJtAf3b2ek6SYJW
         pfErm7mTwp22Z7d74jgJ3hpMa6Eq/OEdwfLq+dFe94rK1ivEK0GropjFlUi637SohLvz
         UBXTOTRLOG63AuiUur8EQAwmHeIeqdTXugFokSayLxZrsaGIQPUJSlW9YdGHqTlBTlcq
         rY+A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788238446; x=1788843246; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8SuycrJ6e1WFHR/TNYgsJOBfzYu56DYt41F/4NfeqAU=;
        b=Y4KCfyX1ruEqJjxlKvO3sj7Mq+2YXV19JPcpglry1NPIq2jPbzDktRNI+TLxWE53a5
         1gYh+qkKqSddZAHItCEWMEk+KOC53EmUjj+k+xCRSYHLyC1B+PMvVI9dTrKW2PIxCD5j
         TESO69mac2ddBjN3S3JTExOYGoJykXp9+vMGkXfg/MX+a7RQC4QdT1VmTJlEOa9TKkHN
         DEyVYvfKpoaZmQFCnL8FBmJaDplIzxB7NXWbBtq0oI76tGvn5CaA21gNrnK/BT8yGg9w
         453ZJ065HZMyfjzqnqRpr0R4ov5C5cAjATU6OPj1fYj1Cjopsd0U40GyPJ50ofPcr0re
         1kDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788238446; x=1788843246;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8SuycrJ6e1WFHR/TNYgsJOBfzYu56DYt41F/4NfeqAU=;
        b=P5n1+9oKq6VXFtEULy5lwKGiJpRs12cU+w3fonRQ0V36LOc9jG1hjFevpYwZBNoh1S
         CLWsSN8TNaVDHIX6BT+QUOuILJK0RCF74HU4kO4oA3AZ4qOfuDtMhyBJkvSPoWd2Mfi9
         R5IUCxuhjtPreQI0HJZNlOM0GnKLgfMvqHj+EXywy3x1hERzdCsXwm7TGueoSPyjfM8h
         RYn79HASIPITqMEbfDAYy+KmQ6vtkdQhPqmn7Fc+faX92oLFFh2EQHwqk0dZDPZ4DpxR
         z9YZT6giBz0DuZ21Q1hkg8QouuGtnaUBlLxA2UCZ1DpJE9FUe5G8yhevLTJP1379B9bp
         sJgQ==
X-Gm-Message-State: AFuF++m5UwMmHj+0H3KuL+htcdVfFs9k2Y4saXkkt9pjS5F94lG8DA2W
	VWxz0EOmBnwFZWjptQTKtFTIFb4gxXbDvBFXAKgQwN4HtSFHcKRPcnbi9gING0IMUOo6FUkvbuy
	etg2fvLR9nbSuWltbXuy6aERSeWmjReb/tFIS8Dk=
X-Gm-Gg: AYBFou1dT0Bm4s0mXCEfyPkQGR346Lbsv1li9tPfFjTqdcm0HMmBRJVRWXYsFKeTlI/
	x0f9vQturHi3jOoNFtLsfE7xfVaDwurgh+cU8C//IuyzWZtcHO7Q68pC4IYJQnXp7cbVzIpPKMW
	g1sR/CV8Xr9PSYECybZwfhaVqzUVsuDlTFV7sl5ANS4yGa8fnvjIEfq3RPPdaSag1UyYOrndCSs
	rYN7PvAbMBnHZ4F+8lhHM2Pfg0DzkL2etnbXULaskrlMuo/0MIlJZuuzLd6tRHGVBPSGsEP/zgv
	BT7Dr3JkfZ72tOYhifOD7QB1PU9NdkTYsJ5j/XSdkfqVDBPhTSdNSg8/k3b2NYPCh600X2DpOEO
	SKE99i/Radt5ol2u7ItYwTl7H9JbXgH33S0t45Yko
X-Received: by 2002:a05:6214:5d87:b0:90a:7f98:15f3 with SMTP id
 6a1803df08f44-90e956e7aefmr37476106d6.2.1788238445773; Mon, 31 Aug 2026
 21:54:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260828033531.1117754-1-apopple@nvidia.com> <20260828033531.1117754-6-apopple@nvidia.com>
In-Reply-To: <20260828033531.1117754-6-apopple@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 1 Sep 2026 14:53:53 +1000
X-Gm-Features: AcwNN1Ud4VFQrRun_tYvFTt-qwucbEEO3S9gIfzjiQyf2D1HVIdudvpKJIZc7pw
Message-ID: <CAPM=9tw6nv7UbMvKOGSsZKKwoZwCG2hvwGk=JjmsxQcH=wGfqw@mail.gmail.com>
Subject: Re: [PATCH v5 05/11] drm: nova: Add an info ioctl
To: Alistair Popple <apopple@nvidia.com>
Cc: nova-gpu <nova-gpu@lists.linux.dev>, M Henning <mhenning@darkrefraction.com>, 
	Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Eliot Courtney <ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 28 Aug 2026 at 13:36, Alistair Popple <apopple@nvidia.com> wrote:
>
> Add an extensible info ioctl and use it to report basic GPU information.
> One of the first things userspace needs to know about a GPU is its
> architecture and implementation, so add that as the first field in the
> GPU info result.
>
> The ioctl selects an information type by ID and writes the result through
> a sized userspace buffer. The kernel truncates results to the supplied
> size, allowing information structures to grow and new logical information
> groups to be added without introducing new ioctls.
>
>

This is a higher level for the future, I think we have two paths for
getparam type ioctl.

Either we expose a big struct full of values with a add to the end
mentality or we keep a long list of value pairs, and userspace passes
in a list of value keys, and we return a list of the values.

I'm trying to think ahead towards native virtio context support, and I
think having the sequence,

open
get_all_infos
create vm/channel

might have the most optimal ioctl count but also let power management
avoid booting the GPU on every open if we never create a vm/channel.

Dave.
