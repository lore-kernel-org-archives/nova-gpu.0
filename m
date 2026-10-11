Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D92367B8B
	for <nova-gpu@lists.linux.dev>; Sun, 11 Oct 2026 09:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791710137; cv=pass; b=Q5dD/DkgYALbRk5u4rKApHEpJUFTTHFMwRkv7AddTyD7/UoCv6+FsV+v0/oNNYuYqrNtwn35Ly00z0nBubk1YwzqU+TJyJtIfw23Y2yFVqG+T/aUQRm4j16u9LXGklia74nYbcK2LLRJbAFIufjHKACpBaNfjSjvD18Y07a2vjY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791710137; c=relaxed/simple;
	bh=hGkdQt3CffghjwhVKgS734IYuXkQ0DDpVgAEI+JBZM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Az5fJa4fXW1tz6Lip7VguZhgmzNrsS5GZFnkc90a31m+CmrsEYRJ0u70MO7VA2L4jy4uRs2CthmBxEATsem2AR/ebUK4PxOkqzjfj369fOuV60UWPyREZqfSQyF50cOWZJyV0PHwUhpEidHrSY3kMCAs0jGDQPKld7AfipzNQIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rcl868jp; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rcl868jp"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33e623bd651so116807eec.0
        for <nova-gpu@lists.linux.dev>; Sun, 11 Oct 2026 02:15:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791710136; cv=none;
        d=google.com; s=arc-20260327;
        b=jqvZjcGKCViQ04T9F0mVAjFPXS7UK9PrzWZEk4m+CAUp1/O4YqiQKUBEp5Nnx479VE
         qSULp7CF4pvVOa44mer4ctrg0D5pqt10W5oUeEbhvdtZ0P74mYqXEE3GdLV5QVFMcl1L
         mwh9IzZlFGDHnj/8ycLxiDGc6xG5NzGAnhx8bLkwFI3ApHldHdh2/YVfqscHlawx3VIV
         JdgqVmkCrIZoopjZglMJtnXfLyifGvfWaVgGcoFYe6N/1gUfdGHtF9b4mCbp5xoWYyFD
         nxd5ScQ6U8tShr1NSRiz5GBqNyhd9S+fk63IFzfiaBX0bmWA7IfpMlSmN89Kvvih3KAg
         /Rjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hGkdQt3CffghjwhVKgS734IYuXkQ0DDpVgAEI+JBZM4=;
        fh=9z3jpKkYQ9mgKKrNhksmSTUBK5Vw4YBQIpjcCwybDm0=;
        b=m9DzHcofXf5GBKfR75D/CBzERJndkxP6D73aepTvUhb5T/R6voP/aA839nLDIxDiJq
         +UYlt9wc1npV7a6cTf9ez+hDmKGlfxJPLBFTUjMtcq0GqFxLXHG7f3dCcVxEginvkg0k
         Yc1WiKqAHi7X7j8dzC19/QYOdSr4kR/Qw75aWE8cp5/qhwrklvucHDS+NAvIkCbp8c7Y
         8CaW43uivHs+H29R1qtzq2UqzFoLBOaXN7qkpNM9/bIVrhHEppUgEYD6y22jO5wVWS8g
         /zf6aSGpCeZJ233BX1N4LYo8O8eOOr9Pvt9a7Jc9dfZols83s0Mi/uJamV8e5ATSSJIU
         ZmZw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791710136; x=1792314936; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hGkdQt3CffghjwhVKgS734IYuXkQ0DDpVgAEI+JBZM4=;
        b=rcl868jpnkXZWGFECFGpeNNxkMi258JHKlkIGSxvagpCExm1YQpMEoPAt7TlNi7B+j
         bSdw8/tu9m8LVYaicejjnQW9lu8t3xMa4t7qHDe0BYWhYnb+f1uZzm2YGQSgWYsgNPjB
         /yoW7qCk97amd1e+tgc/VVTN1zMLYaxrKA+lPO/98WA1b2emvSJyKkdMLA08SUB/3yFr
         x7BQluhmE02bhDMZCcgLY0nkd3q4p0wpBb2y3PAORbALKTwtYrxXa9YYxabkSOC0i20V
         Jdv8na4RasMPFZ6hAwZG3uE18OBAuzHwUDSsTJMwwRBxl62ck9jreVVX1OWZyPPXt+Id
         IohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791710136; x=1792314936;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hGkdQt3CffghjwhVKgS734IYuXkQ0DDpVgAEI+JBZM4=;
        b=mO38neDnMLlF7xy2x+ljnx7VmjJLNrzQmIgE2ExVdF+OV8bb4snDkJPEFUW5hxRpMi
         C3cFyaR5Ufqkq1PDe3fI95VotNsR7uT7bExm3/+weD61bVSWXzctwtz4BU7HnNVX1SKO
         Fuszgm0rmNx8IgFl14dC/9P2eeKjpUrgSJNw56ZhCNpogdQ8PW053IqZ+BKRyrhElNKY
         YL7APP89fzYCvaEZjFsn40mDcU/wRLfIq+FxNlIQ6Zm0PZb4Mnd5k2SZkrovqBAY8ShR
         MaBlgESkKvrWKKsdkPqO4jlnLEhyMS7af5JZiTAG6An+YuDqo0dDIiyDGE1dcbtvEEoJ
         1fLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgTIa7zHFHUd9pEbxclDZR41Ollp6gtehjQTclPKgZmnbzR3DZXD7zJGXh9FqPhroGTlNhacYfLw==@lists.linux.dev
X-Gm-Message-State: AFq9FYLkwNIBSYzzLp0a+oMPvdLnIGIswzuDsjzsMKFBnD2zkl53e0Ix
	Akn6svsJseBW/d/5C+QEF9I+1qRDJ+3Yklr7IGxj4uXYOrTcbq4SULkWa9DLJ3rUK5M7DZvXVVt
	BI+OyalZe9YdncgO55CurnWKne9s6AU0=
X-Gm-Gg: AYBFou2A0jtAb3cucGRbMUrUxY276jLV4+JCYX4L10VZbu16Jr+tpOm0rhvgjPoi5al
	8Ka86IIs67Mh/EiX7vZToiShoEpGzDmrWvBDYDMxSyqwYxkoZSDou2OyvditmNBYtvm29yJpTnD
	i+Q7O5DRgjpvJoOYLXKFFk++3nd0dFLwDCaoCp0zNhmdA5hsTD0EiYc3yQ+Zvt+7/rsBEFujA4U
	xdIii701MBb/1fBt2SjMt+xUqHxPE/AtmWKB/PDGbvoHy2QdgCnLsBKdkHhTVzm+8Mokj1uRmNH
	Qc/PnIc/J8fw4HeY1OAa/4uFLnl7yU77raoVBinXRRrbsFsclEPdO05sF7b0u5HKDQubECXQAkF
	mhjeUQwRDFxaTmmQ6wCk3HRAtjdgZvTgEvNAuQBTTa4Dpv/giaVjeP/X13MUsZoiKBPENWprIaZ
	GNeAN/90GKJmVuM2mkZwsHXlVWUQ1MMh/1BcEPGZG99knKfkIt2qA=
X-Received: by 2002:a05:7300:ea0e:b0:351:6d7f:e2bc with SMTP id
 5a478bee46e88-3537e04ce24mr13816603eec.2.1791710134848; Sun, 11 Oct 2026
 02:15:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260930-chid-v9-0-0d6cca376cff@nvidia.com> <DLZJSCA10YBI.2NIG6CA24G8L@nvidia.com>
In-Reply-To: <DLZJSCA10YBI.2NIG6CA24G8L@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 11 Oct 2026 11:15:22 +0200
X-Gm-Features: AclHuK8oq3naNnD7eambaIbJJqVk3yW7pH0z0MJvkulMtcEMY7rW0rV1YUtor2E
Message-ID: <CANiq72=91-kisxDHJyth3xsy8BdEdqLd3qpHLWqpRxY_bmFSTw@mail.gmail.com>
Subject: Re: [PATCH v9 0/9] rust: Add support for reserving of ranges of IDs
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Eliot Courtney <ecourtney@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Burak Emir <burak.emir@gmail.com>, 
	Yury Norov <yury.norov@gmail.com>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	Yury Norov <ynorov@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 5:05=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> Since that's quite a bit of code outside of nova-core, maybe it is
> better to merge the non-nova bits mentioned above through the Rust tree
> in time for the 7.4 merge window. All the patches I have listed should
> have the required tags, but the `cv!` patch needs one last respin to
> address the remaining comments and add a "Pitfalls" section at the very
> least. Miguel, does that sound doable?

These things have been around for quite a while, so yeah, if we can
land part of this now, then we should definitely try. :)

The "Pitfalls" section can wait, if that simplifies the
discussion/review, since the rest are nits.

Cheers,
Miguel
