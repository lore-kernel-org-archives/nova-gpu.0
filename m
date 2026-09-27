Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1771454704C
	for <nova-gpu@lists.linux.dev>; Sun, 27 Sep 2026 10:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790505138; cv=pass; b=hkDzRNWOL8m51f2iMRsRVatNvp6SvZvz4WEOi0Hih4ERBqzbuHoHwLNVGFl4xFanup9ASwFbOh/ajlmzIXuc+F80B7DE3gwDoV1+22UJXQwXGhkj0Isp4+4IHX0qZ2gp3LWBPRvRimF6YDrB+S8+LyOqXv8ZmV3oRF7SiG6WsdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790505138; c=relaxed/simple;
	bh=SHQk7gkbO2ea5uysrJ1Kbk5JIPAf5arZPkM7Am5MOaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W+4xTAJJ/Y29YuOeVBPy7I6/bPjuA0n/jF84UyNuoVaDjjXj59ufmz2K3SBdGcYR0Sukz1BWcPv8g7q4gODPM5TUc4KaTs1gQ/4ymPumNdwhMgRIPVv2Bj+PgBB8iMtGVnBvRitiDpd/imw/tspLY/dITMnjo62QfrMyW/yDv+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gC1uLqiU; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gC1uLqiU"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-344213c95bdso24014eec.2
        for <nova-gpu@lists.linux.dev>; Sun, 27 Sep 2026 03:32:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790505136; cv=none;
        d=google.com; s=arc-20260327;
        b=YZ3IgkcuKZIMu4txt8huHD2eBapCDzWPHwwOYdYfFQmRxkTvZIloMmy+0c0u8+dNFG
         DcCphPNAh1BkQa07r0t4QPXmbs9J7r8aAihzVaHv7tarnA/973uTPPE6KMErZWekOWuk
         iAPSNKvBwWxCYHeaFDO5bZm3yhj+wsP8SWynpp1eIKJrqTLnNRHpyw0vPX5TY8ze/h1D
         1ouFslEFWKal/TiKdVzjCIkNvFZa/ZZn13vBpkPMt7FdVU+YPCErkJ9xqX37J4Xw0WtG
         NrlHOTg/7yEX5BF9yeO/jmqse09Akzorj6Mt/M9LPZqCSiGVFb2ztc3gwhiaX/4/+BMm
         xKbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T0IBN3YB7gkpyxIrrQJOq1rE0sGtI266Z+5OM5H2e1o=;
        fh=NQ+0VVwQZ1XIkSy4vWBopQoPBlMFQKTm7DhMM9vm/uU=;
        b=LPjT8EgNU5aqdSzzM/hmiWmC47j37LagEQEfHzSo6sFGvYKzqBpPX3RF28veOh/YdW
         yGEolG1NrjEnpdrOsqHFkajnoe3hkUa+42//p/Xbuh2/AH+zY7whrZhmcU0PXkppWYFU
         jzVBXLf/lTu2I6T8XW46rq93Pslj0kQCkbI1DeOme/+qBKoLd6smiIrWW6DkV0ewjMna
         YG55qDhpwqa1zZikyUEn6SaS/Ng9JRiXdFT3OC8Sr5Jc1WHjlXwQawgKIJNSDv2aPIS7
         nLAsB7OOSHeiur4ff2IXPGQ4ggumCKhO/yFaXBsSimXzyFTcSr+xAegtxo/NfgPKsRFZ
         rvjg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790505136; x=1791109936; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T0IBN3YB7gkpyxIrrQJOq1rE0sGtI266Z+5OM5H2e1o=;
        b=gC1uLqiU2BI/1YVyBDYZcfw2JvUWWV/xuoYqiLRn71wl5+SwJ+w4RVpkSF64or0FDl
         RO3hOE7o3TZssVcB064hTnX+lrVxnJNqJHDvIDOxfyHf8MsHyyanGMmZneVLmuA3zAIY
         BSXXm1n6wRCPBuaKckiOrYmPXIRfZ1LdpFn8X7GeV2FmX+rWDwt0guIDDHM2hOY2eSd9
         utZGx4biQMmOpEOIK11O/gWPWMo+AInLsSYjwE4e9BWreGq4KoVcqUKYF2AVnrr2IeP1
         PzGHqvfL9BR4blXKv6sBbABjAQuJhW/0PYY9jX5pxRc0MW7VD7XZLmd5tmQ66v0lWkVG
         HudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790505136; x=1791109936;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T0IBN3YB7gkpyxIrrQJOq1rE0sGtI266Z+5OM5H2e1o=;
        b=Fd6BCI2hse5u6nOKSnJo0+M/xdMZPxqNLELr6vAuaqoGPJ5LKdwlFcCCfY4hGU1Gsr
         z+DRyBEkGUBUAp1uLStjbXs1bSQCfo9dAA9w6JPeyDh5XccnUjGt8Oa4rxn3cVQxrSiy
         ReInF8cPjEc6XFfNB6PzZ2ONnG7bmGzdmGW0HDF31JGPTCeo7ZcMgTMBeNiGj0iPJMBj
         LPoCQaGOYg0INKIXYAXpeSIBSxvMrioFZCBhl9uPaQ7zJh8Vuz3wwStMaQIOXAJZigee
         5q8xwa9ZWLF2taK52QLkN4gnKqXKszTD4pfXlDWhB6S5xh4Zq/MPdjnDLnydyVvP6BRr
         lyfA==
X-Forwarded-Encrypted: i=1; AKwUvBzbMsHym4ymX+d5P86Lwg7Bo+XC0clxBno06xoAkRz5bPYux2dWlwjbum1cUwW5SReviiEAJ2DKRw==@lists.linux.dev
X-Gm-Message-State: AFq9FYJcOaOPmBobOyKrpRqWxOWWKot1rIGen3Q4QqO1zqbr1bAtLzzr
	wYsRqlWu3/5hY62UXmZudfwhucZRuQxiMDHWIdHq7ewd3evAF9vIY+BhxMPduO1sYjUAryGl71o
	l5jXe9oYRhQlg/vaHq/Lb2lhoVkIfg+c=
X-Gm-Gg: AYBFou2rQia4D22F2Y1Dc4C9OKlzfs+vS/X/nBo408R/BxXsdPe/nKlmendb6uhZhxG
	Y++pjA0QVXA6GXBseYc2eGBtq75l5KD8CR7mKfvmoFk/5ps3WeNCLIg7NMdkqz5Ew9u6pE7/E4C
	eRmB6AeLQTR9oaM5IvAOtQfzYZnN3+EJc7vqFQOO4v1muC38cOkkqMZq5KguyMV6aP9FlKOdWBY
	soxNWuYb+Q97IR/Tv8/kVwjLAUHjcU2H3W5UQ6v/ROS+xh8/2DN55alJolxFAz+YALooPFcTwT3
	eY29GWoMX5PQXKfd4BDG1k4jmCyP2T5+/ZkRvJlIfy44nvTXFTRROpoxTc5l/KRpubmDi+/QDye
	fds7B+sJ+BBQllAZqFc37GYg8Sv+okCSb3piDpuHRvdsePboKFrnQ+eT0JhAgXi9DAWJMbkHfPE
	6ngHghU6ShOPj4a0Zcg/Xkx4znKknWY9NGe6jbVrScTH1Wqy8F8sDsp9hCsGUhgleMHCTMrKDd
X-Received: by 2002:a05:7301:dd97:b0:33e:6a79:5a81 with SMTP id
 5a478bee46e88-3427179721dmr8395927eec.1.1790505136091; Sun, 27 Sep 2026
 03:32:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260909064506.910162-1-apopple@nvidia.com> <20260909064506.910162-7-apopple@nvidia.com>
In-Reply-To: <20260909064506.910162-7-apopple@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 27 Sep 2026 12:32:02 +0200
X-Gm-Features: AclHuK8iLs1xJry90CQ3QvtDKTbcAUCAThEBu2i1dWjYp5xrWZkI9Bh3mU59r6M
Message-ID: <CANiq72nFAbA_uEuUfWvdeMQeYJ+uMcAn7z-FWcQOPUcbX9CkZA@mail.gmail.com>
Subject: Re: [PATCH v6 06/13] rust: uaccess: add UserSliceWriter::write_truncated()
To: Alistair Popple <apopple@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, nova-gpu <nova-gpu@lists.linux.dev>, 
	M Henning <mhenning@darkrefraction.com>, Danilo Krummrich <dakr@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Eliot Courtney <ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 8:52=E2=80=AFAM Alistair Popple <apopple@nvidia.com>=
 wrote:
>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Suggested-by: Danilo Krummrich <dakr@kernel.org>

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Nit: if the suggestion happened in public, then a Link tag after it
would be nice.

> +    pub fn write_truncated<T: AsBytes>(&mut self, value: &T) -> Result<u=
size> {
> +        let len =3D self.length.min(size_of::<T>());
> +        self.write_slice(&value.as_bytes()[..len])?;
> +        Ok(len)
> +    }

This could reuse `write_slice_partial()`, though it would need
`#[inline]` to make it generate the same code (but we may want to do
that anyway).

Thanks!

Cheers,
Miguel
