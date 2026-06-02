Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FF12F1FE3;
	Tue,  2 Jun 2026 03:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780371241; cv=none; b=NmDfHqnlSsBuMxtr2MdcqHHa79dpWHEuvsCekINlho4YzM9VaGdzp/utjPSgTb0xjbKMT9zGqazkGHNX24VM8ENnVVH2Q9gnfM8P2gyIlD6AFOmb6riP2sX0fcEOw/Mg8RGYDDqg28PcRdGLwAfR+DsTiNQQAI9fqVk5pijfs3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780371241; c=relaxed/simple;
	bh=ql8TC3EIo474DeYEYwJsJ/R5aPSLxRRgxRpPDpQsI7M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uQSisoMl85JNsgI7mXc32cBH8u458DeMfXf4cXdqIkrLR6ftgwV52Qt61Pk8JEVOE1LU53WNzBtkCA+guM+Gj1HJgoi4Pvcjp9XUjCNc2DFAdPisdByodKezUVsFYj1P2gFGwOVYtxXPynH0qFezsHiQLSum4FkB0tP8b9cuL/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IZFD5PpX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IZFD5PpX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F2B71F00893;
	Tue,  2 Jun 2026 03:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780371239;
	bh=yuFQXClyfYagpSZWdipfCy79mt72uijx8cMv5CoiSdQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IZFD5PpXspHXIFUrnu73BMiLFA7sUkdEfi0Mk5bnv146tKtVVYDcTJ3P+eHjO45YR
	 VASdn8YrNqxu1cSHJQZMVECDshSiFBaZGHDFJUpriKOReHgvaPWT44O7zF+xVyjZPB
	 hFzXEZ7WQ3pSECxVJsOYXI9gOdO+3I0c6c8aHgGsGeTCl8F3jgIezsoWXxzwJtqa4o
	 dULbr4EQLucqdLq594pTb/tIWvZubYDm05HfrDhzdVOzhvWA1HFUyiJrCCbPawPIoh
	 6JdMzPd7MD3vze50vrkGh3b46om1XL+14sKcuJduq9oadkyPoKndaddMJnzmdPkj/X
	 46XafHISs29aw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 15/22] gpu: nova-core: Hopper/Blackwell: add FSP
 message infrastructure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Danilo Krummrich" <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>, "John
 Hubbard" <jhubbard@nvidia.com>
Cc: "Simona Vetter" <simona@ffwll.ch>, "Benno Lossin" <lossin@kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Eliot
 Courtney" <ecourtney@nvidia.com>, =?utf-8?b?QmrDtnJuIFJveSBCYXJvbg==?= <bjorn3_gh@protonmail.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Shashank Sharma" <shashanks@nvidia.com>, "Zhi
 Wang" <zhiw@nvidia.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Alistair
 Popple" <apopple@nvidia.com>, "Gary Guo" <gary@garyguo.net>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Alice
 Ryhl" <aliceryhl@google.com>, "Alexandre Courbot" <acourbot@nvidia.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "David Airlie" <airlied@gmail.com>, nova-gpu@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>, "John
 Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>
In-Reply-To: <20260602032111.224790-16-jhubbard@nvidia.com>
References: <20260602032111.224790-16-jhubbard@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 03:33:57 +0000
Message-Id: <20260602033358.5F2B71F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Race condition due to incorrect order of writing queue pointers in=
 `send_msg`.
- [High] Silent failure when sending a 4-byte message.
- [High] Unchecked integer addition in `poll_msgq` can cause a kernel panic=
 on untrusted MMIO reads.
--

commit 8a59b49984011320aa631b20a05550242e2baef2
Author: John Hubbard <jhubbard@nvidia.com>

gpu: nova-core: Hopper/Blackwell: add FSP message infrastructure

This commit adds the foundation security processor (FSP) message
infrastructure for the nova-core GPU driver. It implements queue
registers and low-level helpers to communicate with the FSP falcon's EMEM.

> diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/=
falcon/fsp.rs
> index 6b057d958115a..0ec1c55213bc8 100644
> --- a/drivers/gpu/nova-core/falcon/fsp.rs
> +++ b/drivers/gpu/nova-core/falcon/fsp.rs
[ ... ]
> @@ -145,4 +143,63 @@ fn read_emem(&mut self, bar: &Bar0, offset: u32, dat=
a: &mut [u8]) -> Result {
> =20
>          Ok(())
>      }
> +
> +    /// Poll FSP for incoming data.
> +    ///
> +    /// Returns the size of available data in bytes, or 0 if no data is =
available.
> +    ///
> +    /// The FSP message queue is not circular. Pointers are reset to 0 a=
fter each
> +    /// message exchange, so `tail >=3D head` is always true when data i=
s present.
> +    #[expect(dead_code)]
> +    pub(crate) fn poll_msgq(&self, bar: &Bar0) -> u32 {
> +        let head =3D bar.read(regs::NV_PFSP_MSGQ_HEAD).address();
> +        let tail =3D bar.read(regs::NV_PFSP_MSGQ_TAIL).address();
> +
> +        if head =3D=3D tail {
> +            return 0;
> +        }
> +
> +        // TAIL points at last DWORD written, so add 4 to get total size
> +        tail.saturating_sub(head) + 4
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: High]
Can this unchecked addition panic if we encounter a PCIe link failure?

If `head` reads normally as 0 but a surprise removal occurs before reading
`tail`, `tail` could read as 0xFFFFFFFF. The saturating subtraction would
leave 0xFFFFFFFF, and the subsequent `+ 4` will overflow, causing a panic in
debug builds where CONFIG_RUST_OVERFLOW_CHECKS=3Dy is set.

Should this use `saturating_add(4)` or another form of checked math to hand=
le
untrusted hardware inputs safely?

> +    }
> +
> +    /// Writes `packet` to FSP EMEM and updates the queue pointers to no=
tify FSP.
> +    ///
> +    /// Returns `EINVAL` if `packet` is empty or its length is not 4-byt=
e aligned.
> +    #[expect(dead_code)]
> +    pub(crate) fn send_msg(&mut self, bar: &Bar0, packet: &[u8]) -> Resu=
lt {
> +        if packet.is_empty() {
> +            return Err(EINVAL);
> +        }
> +
> +        // Write message to EMEM at offset 0 (validates 4-byte alignment)
> +        self.write_emem(bar, 0, packet)?;
> +
> +        // Update queue pointers. TAIL points at the last DWORD written.
> +        let tail_offset =3D u32::try_from(packet.len() - 4).map_err(|_| =
EINVAL)?;
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: High]
Does this create a silent failure if a 4-byte message is sent?

If `packet.len()` is 4, `tail_offset` is calculated as 0. Both NV_PFSP_QUEU=
E_HEAD
and NV_PFSP_QUEUE_TAIL will then be written as 0. Because the FSP protocol =
treats
`HEAD =3D=3D TAIL` as an empty queue, the FSP will ignore the message while=
 the
function still returns `Ok(())`.

Should this enforce a minimum packet length of 8 bytes or return an error
for 4-byte messages?

> +        bar.write_reg(regs::NV_PFSP_QUEUE_TAIL::zeroed().with_address(ta=
il_offset));
> +        bar.write_reg(regs::NV_PFSP_QUEUE_HEAD::zeroed().with_address(0)=
);
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: High]
Is there a race condition with the FSP hardware due to the order of these
writes?

By writing NV_PFSP_QUEUE_TAIL before NV_PFSP_QUEUE_HEAD, if QUEUE_HEAD was
non-zero from a prior transaction, we momentarily create a state where
`TAIL !=3D HEAD`. The FSP may wake up immediately and read from the old, in=
correct
QUEUE_HEAD offset before the driver can write 0 to QUEUE_HEAD.

Should NV_PFSP_QUEUE_HEAD be initialized to 0 before writing the
NV_PFSP_QUEUE_TAIL doorbell?

> +
> +        Ok(())
> +    }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602032111.2247=
90-1-jhubbard@nvidia.com?part=3D15
