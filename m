Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A010043E08F
	for <nova-gpu@lists.linux.dev>; Fri, 14 Aug 2026 10:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786703445; cv=pass; b=Nn6tlPq+slS8uAlTyjwzlRujkVbC/REDFCpnlg5oWk7coN3EXU57DdUjytI31P0J3wGOjEa4B3rqggT5cddiW6/iBprn7F+RjwT6ZuKKmkt0ux47v5NBYDiSNFl2VWAuU9/h6ORFXM/n4knqml4AprdBhemIlDrsZ8hhO8t2Pn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786703445; c=relaxed/simple;
	bh=/SEfN4vHBYJRT3QagL0O+k1OF0dddWY7eIJyIDHff3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K1N7V2a3TAg7ZJk6O83PW65oZ67dBAEW5deJRiMwu9/+2yXizjzBFSWUtPqJ+jy75dJvisBNdihj1e3nWblb6xw+O1bn+yvDh6DIzMkLTqyvPxki85xthG7+FcOeTCbFV+oB0RcdMncvgzEu9eKsdFcq+GjttZ76nUORicJ+sM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QhI0qfi6; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QhI0qfi6"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d03fcd26a6so1313435ad.2
        for <nova-gpu@lists.linux.dev>; Fri, 14 Aug 2026 03:30:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786703435; cv=none;
        d=google.com; s=arc-20260327;
        b=hE0LmceAs9fUoSQSR85rn6JC/7OGvQ5EhEuRb09MEyQh21GHVymrRbHKGK7JQv4COq
         kdfdFhDVLj1XCjwol3pVPD8Sehxlsz/dStbP9eQQ4+w6NwVAtLtiBbh125IbTkfVkZ5V
         QdpwmYXAGoR1QHbQqQgu3iOXnYLnOhBws0kGFF2j5i2cyp7hE9JnSOwCsa+sFsPY4+5U
         MC8pHzYZknF5hQwWo8BqdnShSBmjkbikUhdhQHJq2iLHzF5XTlFlzFM3nCDD4DIhswbt
         sFCzOf+Hko0c2DAzGBqjKyfy9qoF7JEdTOwvveHymFbmeysNdVEY0+wIj1S0Q+4XlTKP
         OGzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3fehzsHa7Sd9X2tq+C9ScVdD8EMn+jQuH5aGR6j+hWU=;
        fh=WQLCll8Nqb+LlvaWuI8CwvNOPYSbwSkOu2Vne2+Cx2s=;
        b=kT3Td3D3YaEefMZjaeWNNwJoUv4yeScK1cYkV/m4wvdYuMmqcuIZlk2AHNF8kOqzzz
         am37lNzQDE7uOSkhg1dKl18nM0e+ICOn6Vt6bcoeG8QQZXBBWOGAEpIhqi/EbvR/dUF2
         erb0pZDKjp0e3MOq6MDyZd1Li7lvPN4UlLf7YnCApsVwdo9y/i3Uib6/pblfeUUEg+1u
         s/PWrKMOjG+cqbwFyALO1Jj/4oIMYGVOHKcj5ntL6SFwi+aCwaS3vCuRbqkwB5hqm5Hj
         41CiQ7PEIlAKtxTTWQ2AfgUw7Co+Wkv0f8lGZs19gu2pQQTWeAVfR8JxT7f+w2zFE10q
         kmkg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786703435; x=1787308235; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3fehzsHa7Sd9X2tq+C9ScVdD8EMn+jQuH5aGR6j+hWU=;
        b=QhI0qfi6aukKXVZSUvgbeFBYUjPCil33qtU6ex6bkzKMgzmcziILIam2eWGHQK8+RI
         HuvVFENG5OHNh12n6ispGusbuajoT8Hg2VrJmZI4xagMQe4oA2W/4dfuA60FhA5mpK6G
         l6U0nYIP1VhfT6GRmx/X7nz+HvfB2CbH/mXTbTP3lIWCe0+XoJ1YjoOW8Fg7Ne+lPnU8
         1n6lXPSlAnc6B7HEcTW9E4kKHl92kx2j4QcwauuUKcHCQCmf3czHnLRrSBv8tlYPoZQT
         FSDXgELGInf7+Fqz8Ms1/gePCRYkQm86dZD9PMJvIA9rSjjLZNmb/7WaY7ynpUOr/g16
         OVVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786703435; x=1787308235;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3fehzsHa7Sd9X2tq+C9ScVdD8EMn+jQuH5aGR6j+hWU=;
        b=cJdGtw5CifDPbUIXx5T6xQva787wHuu0UVjzwPD5N2koXhp8nO5dEFmeZx2hiR+Kjt
         of6JS8BVehNzmx8gWHlGCmjvwRfPCGcwLS+X9bXfZBIJXRhWyVuU9uoP840PZTndYvuI
         OjuZMKZHcv43/3nmI6WTDSWiUnpNXyAprGfNPLWn89vPbwMq3KWt0aSooZeCO84EVlxW
         oBnVJ5TilbHzOBFU97A8SL2dECXVLZl/Vn/cMDRlfosuGZ8TDyJfg0O5gTGjhqaeiEbg
         pVXAhXbP08yXNGa8r0f/qYQcLq4QXQXWbtzBEb0BZGhZ9GIRWzDnuxXcHV94mJ+iwyIG
         Zu/w==
X-Forwarded-Encrypted: i=1; AHgh+Rp9eB8VmTLx9AIZ4Mj4tLDE8dTNjiI0LEfmaH6aXV6k/R23oKXk9Hq6eWJq3bffyh0mNJA4O41fgw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzEISitXl0KsVN08FJwpWXpbsk8Z+TtYBEKmWiiAsZbvi4wSd9e
	BQQbiVpHYtirE0LcPumoHY3hLdbf0Zt5n/6bcwRjniWfn+Q4YowOJ+fY6ZxRH+14ifT4WnZ+VcT
	W92qJ3lg5dF0/CR52AI+hYUV9lMzC33s=
X-Gm-Gg: AR+sD10OZckxpgNO8ihd7oDGHiSr6DeMDNQ/NVE3yApsfDr++hzTs9KBfIKh5riq6UJ
	VUERqZiUrLHagcbEzF/ibF+pGOOZa4gWmk/OH4HxZlqrkr0ISgy7DMNGwgo9uyhanLZ4TFEbAsH
	vGutxAvsrKQeG0OVrQQnvMflmUBgOemCnmVSNaigJdG0zBZLa0tLSsRMnIlgfO7Z6WRZLi9JQ2B
	tgxBk6MzCS/i4M+DpsC0y6pz0rZnPMRqWoUVNFm9ZyPWhIpXS6adkrQzrPRI86U5RJwKU7etwWe
	f0AfeqNgvJNKWMxdCkLQZ4aVpFi+t8adNecKRzMkgQzr734lE4rF5hw4SJtQBqmqMEe6huJcqrc
	TOeX4z+qLOe2XeFkWfQTnfR3NcmsW0irn0S6+ESWHaGRnxIPIa1Mms8hXMDTM
X-Received: by 2002:a17:903:22cb:b0:2cf:7dfa:7f56 with SMTP id
 d9443c01a7336-2d3b0c5dd2amr40185465ad.2.1786703434950; Fri, 14 Aug 2026
 03:30:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260806-as_casts-v2-0-cb76a4d3a6ef@nvidia.com>
In-Reply-To: <20260806-as_casts-v2-0-cb76a4d3a6ef@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 14 Aug 2026 12:30:22 +0200
X-Gm-Features: AUfX_mzbSVhZjPvAzS9iZYtypbsJ35PZ4Nm04Q-zyNGgr6kR87uRIK7yu3xiGYU
Message-ID: <CANiq72=UbRsAJ2Hyk68HDkHL+TVzg9n992jMSO5Bt2iEDYhnrQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] rust: add functions and traits for lossless
 integer conversions
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 6, 2026 at 9:36=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
>       rust: add functions and traits for lossless integer conversions

Applied (just this one) to `rust-next` yesterday (next-20260813) --
thanks everyone!

    [ Added a few more intra-doc links. - Miguel ]

The second would have a bunch of conflicts when merging in linux-next
-- if you really want it this cycle, please let me know.

Cheers,
Miguel
