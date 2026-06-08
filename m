Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0E2377EC5
	for <nova-gpu@lists.linux.dev>; Mon,  8 Jun 2026 07:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780902329; cv=pass; b=mcD7e1ZmBWbJEBK7/xxHeWWdl/5xH+5ImRly3tqULDi4NcOXqGwhZ48smVVabIj7PxLDUAIsr7paLSGHQcHsm43tuTzj8OLf5ytOi0s8pBsDJ24IRNMB2aJhZg/q1I6mJwuf9MCuEu30jZwwSRsmlcceo5+s6MTWMRitzNCtzic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780902329; c=relaxed/simple;
	bh=E6S/j+KIAIqX6WyFaTTwCZ6dEIy8HQ+cgTxVUvZ+vuU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tQ4oa8NHA3/32CAQuCJh8mfbgiyWLtZoROmPuocYKqKUSIDydPCp4uYKBYrjdGnMVCWAOp+LIMXmaZ9wmmbAFwIK8Coiys+IQXqfW1tPgJQUE8od6i7wg19q7mjBxsW3FXx8JqrIrsXpJ7BtSp6+kX2ZEcbcDouXnhy4F4aWmjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JIiOTd/x; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JIiOTd/x"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-304da3b4508so388627eec.2
        for <nova-gpu@lists.linux.dev>; Mon, 08 Jun 2026 00:05:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780902327; cv=none;
        d=google.com; s=arc-20240605;
        b=LVUvhrt2ZjT33Kvgd48u7FVf6SIXdxyynCJNDqITuuaeOsbYu3pbXxRITEBhLAx4Yd
         tAWTTf9iaIhtfvRO/QzQq0qFjZqp4d7SuyeeShiN0EdTaAWMt/GtAkWE316wmFIZbp53
         KDhDaUW+OJjiHfyMs6gO9fwVWvRXtQ38d61m0xyoP6ZMfLpJT0z3R/MQpWBrh6bGKTw/
         sSrMPDmNo02guKj5xwm3fWYBUhAhuTXlupEKyPQLH2PcfZP2AAyAHFD8us8f6Lo++dio
         rRAp8RPs4/8VH6pXzP9urmx2Vzyv3rmY1LL77Qx3pSSpaPw4BxV1cH/UxgixBt0DRCYf
         ySsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OTgjDjW0iNyWJGjqvsWZoe49w6xSITfHiVT/lKWAqV4=;
        fh=peTx32aNUAL5rTyvzULJYB3/WFi3rAJqsfHGNuC/YVU=;
        b=leYtDPxZVNRmW0TqUG+Jjp2+tFHdU9DKTPbA4dsYG+Jl0Ea5uHzQRbz6YgSuhnBOak
         u/ZfffVR1FXOuPaOcHrvIBK0gWCP0KdwU43O+v7A8ieAX8meiwcSpxpHl6ki+cEhjQnW
         RDAjWCXqy4Xb1NoGjFfvLbQ0JyvGAfiXqlj4Zz8VxMT9xn10LV3LrFoyxAQS4iWWcvr1
         hardod8DZwgFbOUh5F/MeSlPxsBhdxPZVv25G1oz8nfLU/O5nnWPSD3e3/oGEEgM82Xe
         FO/7wrdsbwhmaPz/OfqG+SqGZrg/BDcdc6cDfMz4YWpOqsOcEU9qHHOX+zIAPGJ+D/96
         RiWg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780902327; x=1781507127; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OTgjDjW0iNyWJGjqvsWZoe49w6xSITfHiVT/lKWAqV4=;
        b=JIiOTd/xEtoe6MZ2zT8gnqNIUVyTBEDZJdtpyrEV8E/ns27Nupv2cOzZocCE5UZNCW
         dWu6LaJ0n62gY6R26xz9Aibuau0+GYG9NaIuwmRJQD3wr45ZcYog42vpyqP2OZ3m8hFo
         /Hp4aEACnshl2arwoB6/+BNq5x6+y3mS48YLHAtZFjnosP1RDIQc+3LQC9pdSG+D7KRm
         u0SHRJtQHGu8qEffKLOTUeCCPmLYoChbtQ6E6/DC3u4Itg7dBtv9T6aBYTddbHiaS6Ft
         cWR1LSX1Ku7Fn4tZpOs8jLJSz1qJ9IKeO9kdoF2GhQxURl7b8vHay82a54mCHZ8bR5Tt
         uqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780902327; x=1781507127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OTgjDjW0iNyWJGjqvsWZoe49w6xSITfHiVT/lKWAqV4=;
        b=CpT9+LbjLNkgePeEAdZKDx4US8J8Pxt+i+iNILosyih2kZbgYuA5yxL2RvwYOmvaaH
         5ep/2TEUGF81w8XTl3baVnRFRJcVWl7a76PlyvCP6uEbli2VtikvReAIp9kz8dO7V9J/
         i9IOnTV4nFmwbSmRo8QgVQi7Pv4IRYjEQzrfLw7Yv0MHRmuuFluY3B40laQVL3bOrHoz
         Z3tlWUt2phjChk7Q6wmQCHW2S1EQ4Ek1S0RYRgZH85aj0fFdMGvKu6Ah/GnT3Uxm9M+R
         TaDTxmoH33FmBO4J5PDyAOFJ/peVmZk5ZlmsLf8o2c2vQ9e7mj1xPcqdz8lSdFn7yHw9
         e9SA==
X-Forwarded-Encrypted: i=1; AFNElJ+nWaMmeYW8230Jyuh0z9JUVbJNil9nK8aOjL0E9pJSlPbR3Zwo9Ca5nVyEIshioka4XmJWtR4A6w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwPLV5rkqgq0aYgQbRjts/bD3m9plR6fDjwTDgyyQtybyzRKK8Y
	0iWBdOPctpXX7wyiqxo8yAxwEqFwAdaZzNkVClexbGK5xV+1LKyn44E5Ax3hotTHURuj9ZyVW7o
	5f4hnZywX6Up7v2NW9KNFifPNglwieSA=
X-Gm-Gg: Acq92OFE/p3IGfbU+XC0U13GfTkuwIG0gFkfRn9IWa+VJk6pWX693j3OApN4rJcY+ev
	VuCT/XJtyPwXbaomPLm9Qc/LZf6UV1+/n8/FcRih0uBCvbOmMCg7xk/WcDEMlOBKnH7tgYqRbe2
	3TQ9qSVgNnCNh9iScOcHOCLrXZtoTuAMDYg+Z3da6boE2RI2QRpSOHb56S47oK7VL7ZUjXc/2fq
	4Nq+dattMSRoXn61izvurIVwzIaWce20L3HV2uhW4HphICxth+c7azofq3Tmnbkrn3t+CBb4nMc
	sTHY4v6Fek+Ig6lUh5KqBkSJ/dpfehWEPRPA3CYJsOQMNKbLkAwflP/pkh2iD2WmW7wNTZKyGo0
	sXnGDeTJjBx0LY7pzr1yPl5KWEO6FH7L0dA==
X-Received: by 2002:a05:7300:80c9:b0:2d8:7302:d3c with SMTP id
 5a478bee46e88-3077b36698fmr3200266eec.4.1780902327103; Mon, 08 Jun 2026
 00:05:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260606-bitfield-v5-0-b92188820914@nvidia.com>
In-Reply-To: <20260606-bitfield-v5-0-b92188820914@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 8 Jun 2026 09:05:13 +0200
X-Gm-Features: AVVi8CesUULmJzmIG8x0edIeni_P9lO4e6pOHsp_2M6-VMNw_x1NersZexZHfEc
Message-ID: <CANiq72nCi_jjQ=-vYGMNRe2P+m4fEZMcQDnUDb4Nr9+iAiHeKQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] rust: add `bitfield!` macro
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev, 
	driver-core@lists.linux.dev, Yury Norov <ynorov@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 6, 2026 at 2:43=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> This is the continuation of the `bitfield!` macro which started
> alongside the `register!` one before being temporarily integrated into
> it [1].
>
> This series extracts `bitfield!` from `register!`, adds unit tests for
> the new macro, and replaces the `register!` macro rules with the
> extracted version.
>
> I have removed the `nova-core` patches, because the Blackwell support
> that has been added this cycle (and thus not visible from `rust-next`)
> introduces more uses of the Nova-local `bitfield!` macro that this
> series intended to remove. If these new uses are not updated, then
> `nova-core` won't build, thus to avoid conflicts and/or build breakages
> I think it is preferable to merge them during the next cycle.
>
> This version is based on `rust-next`, with [2] applied.
>
> A tree with this branch and its dependencies is available at [3].
>
> [1] https://lore.kernel.org/all/20260120-register-v1-0-723a1743b557@nvidi=
a.com/
> [2] https://lore.kernel.org/all/20260417031531.315281-1-ynorov@nvidia.com=
/
> [3] https://github.com/Gnurou/linux/tree/b4/bitfield
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Applied to `rust-next` -- thanks everyone!

    [ Added some more intra-doc links. - Miguel ]

    [ Prefixed test suite name with `rust_` as mentioned. Markdown-formatte=
d
      a few comments with Markdown. - Miguel ]

Cheers,
Miguel
