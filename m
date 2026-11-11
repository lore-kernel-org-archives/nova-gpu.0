Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794361379;
	b=s2TIlKbJDRcAI0EW0sgCXEcHeiMdqtKmuCcqyYYcgKnmkAolqaEvWvdU9s2D8xKlra28
	 T8/Q0LkLBUvgHSh4DX0bxrCrNtVkHC6zOUtfW6DH21EUWA1SVAwlPp/Vd3ANYO/2ZS1Dq
	 OhCZN0h9uDq79zERFfG+5BhwqG40NVeFjKJsSQmAb6nGmLvoIYUec/1KO40xGc+hZOEBm
	 Jxaw5vN0fNRIKmgaass18CRYyWvC57aJ8H5t+oK1xHjLW4MP1dkhMv8KmLCKyYpQ2xJUq
	 sTX/8AC1uJWZcI2eH2OVMEbPE7KP/ot+oNMcfK30/aE+jZr+jhddNtor/bUOSfUKCrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794361379;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VJx+T+tUk64W22k5TVpjQnYqQRSAfP1LsLu8jCGhpVg=;
	b=ivNpNIoWHqR4nKRNjgXl2fwIVq3jaKqGFGIIsNhCebqtrkRFPen4MMYN1Im7eYxnc96V
	 MqCtMvf43+cvqdqKMD/C7S6rFgLKhE64y0pTyyJ/eq3d/yM/g8L2T9P165KYMLsyL1YQf
	 UoTh4m3e4Jn4eBKWwwKjIED37VBDpifcLBldZsGo057TjIYkc7gwXX/ixfv00jjR9gZY/
	 C2GF3knL8Om8ugI2Re+ILwtenL8p7bw0YS0QlkoRKNIB5zZUkM6SQ7jUy0LqUgP9PUEpM
	 5oGUfx0GbyMfbsUTySVTB4n2sv3MaTy071mxhvN8dZ4LVFISaKWV1aSDNgQyhNdMJhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fgxs3R8r;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22359606A324
	for <nova-gpu@lists.linux.dev>; Wed, 11 Nov 2026 01:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fgxs3R8r
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D9BA1F0093C;
	Wed, 11 Nov 2026 01:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794361379;
	bh=VJx+T+tUk64W22k5TVpjQnYqQRSAfP1LsLu8jCGhpVg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fgxs3R8rA2QW2z97COb/ctM0zqMAYvm569PfUDzjRe26HmPxJF0vbVogzXsQxdeI8
	 ERKbrQqZH8kf0s1gePu7EQ5cHBRXhd/AoZLzIYw8h044JclupnR16YNO/n//lAFVIY
	 4zrCsNq5rW98RHrzt+AGnz/1KAisHO11gLJPrrK3Gu56gapAAn1Px5I8cDxUBSH2sd
	 TqkjPh35afXhgIuckhqIGRUgCqekeYWUTssPx41FHwEVZuFl+GWWBsYRXZNo1ixNS8
	 QrrFvwDc6qInXgkJQ0zaKzw8PWJJRdOnMhd0C4an8kz34HnppFFI0aHa+FjS8SN8Bk
	 /dzhjQivqJiHg==
Message-ID: <sashiko-outbox-208053@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] gpu: nova-core: gsp: cmdq: wrap the sequence number
 on overflow
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eliot Courtney" <ecourtney@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Alexandre Courbot" <acourbot@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20261111-msgq-64-pages-v1-1-d8c56b6fdd6c@nvidia.com>
References: <20261111-msgq-64-pages-v1-0-d8c56b6fdd6c@nvidia.com>
 <20261111-msgq-64-pages-v1-1-d8c56b6fdd6c@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 01:42:57 +0000
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Critical] nova-core: double fetch in receive_msg() and
  send_single_command() [1]
--

commit f82fa576ff320e318515a10dc3abe76b072d7cb3
Author: Eliot Courtney <ecourtney@nvidia.com>

gpu: nova-core: gsp: cmdq: wrap the sequence number on overflow

This commit uses wrapping_add(1) when incrementing the command queue
sequence number so that it wraps around on overflow.

> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> index 5f3de456042e4..33074bb53e8c4 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -578,7 +578,7 @@ fn send_command_element<E: CommandElement>(&mut self,=
 command: E) -> Result<u32>
> =20
>          // All set - update the write pointer and inform the GSP of the =
new command.
>          let elem_count =3D dst.header.element_count();
> -        self.seq +=3D 1;
> +        self.seq =3D self.seq.wrapping_add(1);
>          self.gsp_mem.advance_cpu_write_ptr(elem_count);

[Severity: Critical]
This problem wasn't introduced by this patch, but can a compromised GSP
alter dst.header.element_count() or message.header.msg_length() in shared
DMA memory between checksum calculation and the pointer updates [1]?

In send_command_element(), dst.header lives in coherent DMA memory that
the GSP can modify concurrently; re-reading dst.header.element_count()
after computing the checksum lets the GSP supply an out-of-bounds count to
advance_cpu_write_ptr().  Similarly, in receive_msg(), wait_for_msg()
checks bounds and validates the checksum using header.msg_length(), and
receive_msg() then fetches message.header.msg_length() a second time from
shared memory to compute elem_count for advance_cpu_read_ptr():

drivers/gpu/nova-core/gsp/cmdq.rs:receive_msg() {
    ...
        let message =3D self.wait_for_msg(timeout)?;
        let elem_count =3D u32::try_from(message.header.msg_length().div_ce=
il(GSP_PAGE_SIZE))
            .map_err(|_| {
                dev_err!(&self.dev, "GSP receive: message length overflow\n=
");
                EIO
            })?;
        ...
        // Advance the read pointer past this message.
        self.gsp_mem.advance_cpu_read_ptr(elem_count);
    ...
}

Either double fetch allows the GSP to desynchronize the ring buffer
pointers and trigger out-of-bounds reads and writes in shared memory.

[1] https://sashiko.dev/#/bug/linux-a84fa791-1958-42fa-b404-d7ebcb48d6c9

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-msgq-64-pa=
ges-v1-0-d8c56b6fdd6c@nvidia.com?part=3D1
