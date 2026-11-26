Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795706171;
	b=jj9821h6brvDY2slG+rB4DDRIsIO6IrG+Tp20KKaA3MaTsTrE+GN2mxRoCwyerGHo1wO
	 TIGq2bqR1htfiyojj/kCT6fRRQ7nSry8IzEM4z0Ws+MyvxUPSzc/HQQb3C0NO22TBZ4ON
	 SZD6QmdNJjJJzAfypz9baI8/zXWpxnaBisWvnU8Y6d6zP6rwwljrM+32Kokobyx/5UgzK
	 lm04gVidQlU4/gMxy2ojDbWKEt22OK7ikbOUxdjoAqFkpQsCD+l45NONDHBVDtYTKi8+8
	 HD9B5CrRYQoKONKAXS8FzDrYTOeUEIydDUBbnUSrbsd635abpTd8UBy95mTvrMzBSuA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mBvXmBLkI+5ZVDxMnAotYXXXMOB1nSxF2QoCNRUPkp8=;
	b=ugh6pAN9RrSZND142fLhDSQujlR7+4DSbB7ZkctoO6GspxxRN4F3wIuiuznNNwmYoUU9
	 IKXmA87kFcfVa6WSUQtJCW1bS17cbNU4OmlOmP/zBD1zZhlvW151cBG46M6SvMqyHqZCW
	 LwTkAezYGyZBpbR3KAgjFLuroX3NSpV3PzK2UNe13G+HV+fZTfYheSA2g/kM1X8Gg6yIk
	 mtyiPmoQg2Zfb+P6l0m7ywGl+41XBmWmxBTaOCkt3tmvT7qgIHK0LFcoyWow9eUqcEHcl
	 C4KB1iRAxbPhpDs2dEa0NMEp583ubEf7KlAb69jnw7sGAQnyhUZ8SlLPukGryLHv2BA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lOrthxji;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC17606A32E
	for <nova-gpu@lists.linux.dev>; Thu, 26 Nov 2026 15:16:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAC17606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lOrthxji
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so92069065e9.1
        for <nova-gpu@lists.linux.dev>; Thu, 26 Nov 2026 07:16:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795706169; cv=none;
        d=google.com; s=arc-20260327;
        b=F03Gur2cDgbUvzHA9jTHxP+UzXxVEMYenzORCX237qKuv0olysdcX9QVeHdD4MXDB4
         qKQyZeFQ+DRm3VWAfhpkcSrfzOrlXAypH+dYNkTai3Jq7PRZvgtOu++5up+bxgE1gZ9V
         WFVEcy5sxfL+K7FZFGjxkhRCN5o9KQK9oIu1yvqCrWmhZdA6/P0TZy+ltLoWhCVr5Kow
         X4Qa4ueRuYVoTWrvxh5Nm6ilGXk4MEPS408TrHPCkBsn+PgIWfZXlO235iD+yk/3HIEE
         ec4akifnyDqQ1vofGODQYRpkIDGAlbauNUcu0kYPjJf0L4vy48x0FsZE0md5ouTHcpFt
         Q2PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mBvXmBLkI+5ZVDxMnAotYXXXMOB1nSxF2QoCNRUPkp8=;
        fh=UrsStiOZtVmnksfdhA8zAqj0jnokLaSq1wSTqsq8c3c=;
        b=gvHWCqt+QYc5X0faT2yj3olq9ZRi1x79+7xjlv7iIedfDhKtaR7p4ZAMvBRYpsAGT+
         cpcIzC0tSToN6UPRwsuK59JTPXWMi3dhhcO3mXANoBgVtQxg0cXe8WG7MOmMOs8C1tzN
         aVdGHvO9cGKjB9D6BkrwYb+sFIt2ga3J+9NQMUhIurpji6p4sBFY+mH5XdifDDtbPj6C
         Mak9S0GeiL8mFZdbbAzbDOAYM+qvXAuyLQf27fls8gH/07/1BuneJcP5f6XQJWn8iqnA
         2exrQ5OT8CBkJt7IX6SuDuiiSG9usx4Dda0Oyf0cNeDqkRY/SHI6uSaTvCAe8mUcwPs+
         crdA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795706169; x=1796310969; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mBvXmBLkI+5ZVDxMnAotYXXXMOB1nSxF2QoCNRUPkp8=;
        b=lOrthxjipE6f3JAX6xe2ycKyNrAsLUM5lHxMa/QwnOtc4cJ2oONunxdSAPABzso6ag
         DcIZZTWEu/Nhpu/7zfUZcI8TBm2l4l3qGcsaC85kfzqaEvz4KtXX6422jgtLfxjWBpK/
         Cipm9gk/DowUDrMuNkzpSjLu6wYhzfT5oJ6B55xns3zmGSN1US8Z8v3rcTGmqmJPujKM
         zth8auva7wnFSwgfCZV2SkONdRt92x+MR264DwSa81e14FOz4Mu0kQqUvwR0+Ut7d39T
         VKYiAiegvzCZaUM3fkKWFwEWyHNwnEHzpJgG/YXzITgUBvnWtTpRUGMQydiWnDDFOQoF
         ffDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706169; x=1796310969;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mBvXmBLkI+5ZVDxMnAotYXXXMOB1nSxF2QoCNRUPkp8=;
        b=ojVBe/tXsIU/d8XIAjCst+CLtnEjoWz+7FcSsdUu6JdXR1RVBhyU+wHM/aYVKoCefp
         50AprA1IJnxkl/j9S3vC7mJd9uoFofVakUiv97GYwXl0VX1g9CI+qkPokKoJKS9EUTfF
         jeMAyfa6/7dKEzKn3tfT5i+2ralZLW0tOuTxyVdsz93G4os3gAMdCHLjklWP5Ox6VB62
         Rf9lYOfqDZwqIcsfqjW7xc17oHKcEGW7z4ey4Kn+FsRgO0M5xm5Zsy1tv4RA4yuWhKUs
         ZckVqHngzcnfUZ2BHEAILwU6OsOrR7l6V9PExvsv7g/HTEbxVcPhtTec5wMONTeyAomn
         JwWw==
X-Forwarded-Encrypted: i=1; AL+hErEa3GAJ8SU2CNhPhLWkcv/c3ADbNKQiahsoTQKbMkWHerHKKVD3+zxYVA6IG5KZoxRooXcv6D00HQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+nirpUCT3TD20+v4hEUHrZJo2DAPzg6BlmECWmJQac5IDwxBOD
	vZ1Z4NYunH6kQJnXWtoBtsw0Yw29+1ofNSHVdKbV5jl7r3HDEliuw+Mbdt5s9LCi+1dSa2aQzlH
	HbeY7CLDfpwWq3aiGxfolHgMDCjMgF658ibw5x7T4
X-Gm-Gg: AZFdTZd2QiTR2dsp7UJABACYktcaZ3jZ3jKCJqL2OwZH8pApwTtpEP/VeVCh37D+UPc
	DwYvvUvjHgjD385mcoiRny8SvQUODqnOQNMss57jzOmtjwt6RkNtzeSS2gzaHJujoHiWbVstmer
	wmogx6Ag+RG6G+vNqC7bj0PqQenYWoaAmTvR+hPAfyyOvGcU/u43cq3oZqRsMynTxdGfVd9qP5k
	gq1jLu+j4R1qnxl+SeRga6lvrZFY1QlD8SqrDSs8IKFoKssPEtp/trDHRhpw1pIJHlWUd99Ze4b
	ohfGuu2CZu+FW+wayVZSzZUNJ2TGfgZ3w9Z5TplRgpzBz099RQZp23gDCMd+h/BeUIOIOGlp8lC
	Rv56PelNiGj4wFtK4p1JcdzhB6RtuD+IAuqYW+wunCWFbXal9CesQ+FKTCCFnE5VfNBrR453kcB
	wPtH/7OfjjOLg0uHa7WnoSqeNqvTC+8DsLo8FLCRcbXDrK
X-Received: by 2002:a05:600c:16c9:b0:4bb:7ad9:311d with SMTP id
 5b1f17b1804b1-4bb861692a1mr332818735e9.19.1795706168571; Thu, 26 Nov 2026
 07:16:08 -0800 (PST)
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261119215046.2892839-1-xinmengs@nvidia.com> <20261119215046.2892839-8-xinmengs@nvidia.com>
 <DN4P1UAAVP8G.2TUW0Q8UEQVCG@kernel.org>
In-Reply-To: <DN4P1UAAVP8G.2TUW0Q8UEQVCG@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 26 Nov 2026 15:15:56 +0000
X-Gm-Features: Aa3M54o7yVaAHH6adwEWSabFuYapgO-QYKd3fskOtzrfMLGKtESTl7nq44reziM
Message-ID: <CAH5fLggYpTiLKDXMQ9UYBGZ9VuZBWbNfCZn9fs=i82-xf6A-1g@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] rust: vfio: add PCI variant driver abstractions
To: Danilo Krummrich <dakr@kernel.org>
Cc: Simon Song <xinmengs@nvidia.com>, acourbot@nvidia.com, kvm@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev, 
	linux-pci@vger.kernel.org, alex@shazbot.org, jgg@nvidia.com, 
	yishaih@nvidia.com, skolothumtho@nvidia.com, kevin.tian@intel.com, 
	airlied@gmail.com, simona@ffwll.ch, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	jhubbard@nvidia.com, ecourtney@nvidia.com, cjia@nvidia.com, smitra@nvidia.com, 
	kjaju@nvidia.com, alkumar@nvidia.com, ankita@nvidia.com, aniketa@nvidia.com, 
	kwankhede@nvidia.com, targupta@nvidia.com, linux-kernel@vger.kernel.org, 
	zhiwang@kernel.org, zhiw@nvidia.com, boqun@kernel.org, 
	daniel.almeida@collabora.com, tamird@kernel.org, work@onurozkan.dev, 
	jgg@ziepe.ca, bhelgaas@google.com, kwilczynski@kernel.org, 
	dri-devel@lists.freedesktop.org, peter@colberg.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 11:51=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:

I suspect Mapping<'a> should wrap a VmaNew instead of VmaRef.

Alice
