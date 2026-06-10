Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173AA2F6918
	for <nova-gpu@lists.linux.dev>; Wed, 10 Jun 2026 22:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781131061; cv=none; b=d/ysNAD3j09NqKi70hmqDyM0aKNso+PXCXLrGEpkibDbx/Q/uyfpj7THlatmEF/YWpCLnoHn6wwP3SA4dStKBVGXHqdUQPZgTZ9ePxwusIpqJ8RV6NSmqq0DiMTsrV2z9qkyFX1orL698Atq9EaEFaxwj/iXIITMr5t8ZsGVYv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781131061; c=relaxed/simple;
	bh=sK2tKdi+Num5zvopKwHlZeMLq+1cPJFd5PF/e8QTORw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=XZ+Ex5OnxwdVLGe8obepK/tmjBA+TcMF9Z4eHPp4gfi7XznLqc5y1juUM5yP6N5EvjuBy/SJgHLsnEkJJxOrSfAL1mOiXHh8pdCRJ+B2GpUtFmj6nlGNZvC7Nsbf2MoWfKxofpSt5hW4Hvqa9xAgFe8wr4XOaiN66SDimMSfv/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HQNblBmD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HQNblBmD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB82A1F00893;
	Wed, 10 Jun 2026 22:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781131059;
	bh=zDarDSo+gtqlsjXCXDnQjDTtjn1c+mw+pi+ZYlHCWO0=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=HQNblBmDBWebupBtPhkiX7dLbdQV4g6sbqXDfqg05+BuRRNt4KoqcJTKezIbCCefM
	 LUapgaVg1fnsJ6HgTPvDJ/xDU4eSNFvRWrLTuixkUPzQZ9GAflogyYjOOX6SaurVDk
	 2mpyKpu798fqliBcecdHi9hAH1+5yV/rMcvNWYuStCTP1L0OJyvORUQMCaJ6Vu8KlE
	 F4AaRTc4DIwV/8Pvm5LNuKGpblIytYD9DTkNSZE7vBCNErPXa3GmYk4OirVtx+mjZU
	 UXCciZ+qcyoyy6LJSNbEwoyD/+/+19EU5m9rP8h0oPz/dq258oflk7I5h3Fve9Ri7D
	 UX4J7SIiaIWNQ==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Jun 2026 00:37:35 +0200
Message-Id: <DJ5Q9J19NVQO.15OGQVSCIKO06@kernel.org>
Cc: "Gary Guo" <gary@garyguo.net>, "Alexandre Courbot"
 <acourbot@nvidia.com>, <nova-gpu@lists.linux.dev>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 <zhiw@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 3/8] gpu: nova-core: add TLV parser for firmware files
References: <20260610174929.744477-1-ttabi@nvidia.com>
 <20260610174929.744477-4-ttabi@nvidia.com>
In-Reply-To: <20260610174929.744477-4-ttabi@nvidia.com>

On Wed Jun 10, 2026 at 7:49 PM CEST, Timur Tabi wrote:
> diff --git a/Documentation/gpu/nova/core/tlv.rst b/Documentation/gpu/nova=
/core/tlv.rst
> new file mode 100644
> index 000000000000..8223605daa6b
> --- /dev/null
> +++ b/Documentation/gpu/nova/core/tlv.rst
> @@ -0,0 +1,172 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +TLV Tags in Nova Firmware Images
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Thanks for adding this!

> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/fi=
rmware.rs
> index 2749c196416d..888a426b7b41 100644
> --- a/drivers/gpu/nova-core/firmware.rs
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -11,7 +11,7 @@
>      device,
>      firmware,
>      prelude::*,
> -    str::CString,
> +    str::{CStr, CString},

NIT: format

>      transmute::FromBytes, //
>  };
> =20
> @@ -684,3 +684,240 @@ pub(super) fn elf_section<'a>(elf: &'a [u8], name: =
&str) -> Option<&'a [u8]> {
>          }
>      }
>  }
> +
> +pub(crate) struct TlvBlock<'a> {
> +    pub(crate) tag: &'a str,
> +    pub(crate) value: &'a [u8],
> +}
> +
> +/// On-wire TLV block header: 4-byte ASCII tag + little-endian payload l=
ength (bytes, excluding
> +/// padding to a 4-byte boundary).
> +struct TlvBlockHeader<'a> {
> +    tag: &'a str,
> +    length: usize,
> +}
> +
> +impl<'a> TlvBlockHeader<'a> {
> +    const SIZE: usize =3D size_of::<[u8; 4]>() + size_of::<u32>();
> +
> +    /// Parses the first [`Self::SIZE`] bytes of `hdr` (caller may pass =
a longer slice).
> +    fn parse(hdr: &'a [u8]) -> Option<Self> {
> +        let hdr =3D hdr.get(..Self::SIZE)?;
> +        let tag_bytes =3D hdr.get(..4)?;
> +        let tag =3D core::str::from_utf8(tag_bytes).ok()?;
> +        if !tag.is_ascii() {
> +            return None;
> +        }
> +        let len_arr =3D <[u8; 4]>::try_from(hdr.get(4..Self::SIZE)?).ok(=
)?;
> +        let length =3D u32::from_le_bytes(len_arr) as usize;

Here and in a couple other cases, nova-core depends on !CPU_BIG_ENDIAN, so =
that
shouldn't be necessary.

I'm not concerned to keep it for documentation purposes, but it may be a bi=
t
inconsistent with the rest of the driver.

> +        Some(Self { tag, length })
> +    }
> +}
> +
> +/// Sequential scan over [`Tlv`]. Unlike [`Tlv`], this type carries a cu=
rsor (`pos`) into
> +/// the parent blob.  It is not interchangeable with a fresh [`Tlv`] vie=
w of the same
> +/// bytes.
> +///
> +/// # Invariants
> +///
> +/// `pos` is a byte offset into `tlv.data` that always lies on a block b=
oundary (in the sense
> +/// of the [`Tlv`] invariant): it is either the start of a well-formed b=
lock, or equal to
> +/// `tlv.data.len()` (end of iteration).
> +struct TlvIter<'tlv, 'a> {
> +    tlv: &'tlv Tlv<'a>,
> +    pos: usize,
> +}
> +
> +impl<'tlv, 'a> Iterator for TlvIter<'tlv, 'a> {
> +    type Item =3D TlvBlock<'a>;
> +
> +    /// Returns the block starting at `self.pos` and advances the cursor=
 past it, or [`None`]
> +    /// once the cursor reaches the end of the data.
> +    ///
> +    /// The body relies on a number of `unsafe` operations, because [`It=
erator::next`] can
> +    /// only return [`Option`], not [`Result`], so there is no way to re=
port a parse error
> +    /// from here.  That is why the entire TLV stream is validated up fr=
ont in the
> +    /// constructor.  By this type's invariants, `self.pos` is always on=
 a block boundary
> +    /// into already-validated data, so each block is known to be well-f=
ormed, and
> +    /// therefore the unchecked operations cannot fail.
> +    fn next(&mut self) -> Option<Self::Item> {
> +        if self.pos >=3D self.tlv.data.len() {
> +            return None;
> +        }
> +
> +        let tail =3D &self.tlv.data[self.pos..];
> +
> +        // SAFETY: `self.pos` is on a block boundary (`TlvIter` invarian=
t) and the check
> +        // above gives `self.pos < data.len()`, so by the `Tlv` invarian=
t a complete
> +        // well-formed block starts at `tail`.
> +        let hdr =3D unsafe { tail.get_unchecked(..TlvBlockHeader::SIZE) =
};
> +
> +        // SAFETY: same header bytes as validated in `Tlv::new` for this=
 offset.
> +        let header =3D unsafe { TlvBlockHeader::parse(hdr).unwrap_unchec=
ked() };
> +
> +        let stored_size =3D header.length.next_multiple_of(4);
> +        let advance =3D TlvBlockHeader::SIZE + stored_size;
> +        let payload_end =3D TlvBlockHeader::SIZE + header.length;
> +
> +        // SAFETY: `advance` and `payload_end` are exactly the stored an=
d logical payload extents
> +        // `Tlv::new` accepted for this block.
> +        let value =3D unsafe {
> +            let block =3D tail.get_unchecked(..advance);
> +            block.get_unchecked(TlvBlockHeader::SIZE..payload_end)
> +        };

Given that this method returns an Option anyways, this could just use the
corresponding safe accessors, e.g.

	let hdr =3D tail.get(..TlvBlockHeader::SIZE)?;

Alternatively, we can just use panicking accessors with a '// PANIC' commen=
t,
but again, since the function already returns an Option, this isn't a hot p=
ath,
and the panic comments aren't obviously trivial, it might not be worth it i=
n
this case.

That said, I'm fine with either safe or panicking, but I don't like the uns=
afe
accessors.

> +
> +        // INVARIANT: by the `Tlv` invariant the block at `self.pos` occ=
upies exactly `advance`
> +        // bytes, so `self.pos + advance` is the next block boundary (or=
 `data.len()`).
> +        self.pos +=3D advance;
> +
> +        Some(TlvBlock {
> +            tag: header.tag,
> +            value,
> +        })
> +    }
> +}
> +
> +/// The payload of a validated TLV (type, length, value) firmware image.
> +///
> +/// TLV firmware images start with a 4-byte "NVFW" magic header, followe=
d by a sequence of
> +/// blocks. Each block has a 4-byte type tag, a 4-byte length field, and=
 a data payload
> +/// whose stored size is the length rounded up to the nearest multiple o=
f 4.
> +///
> +/// [`Self::new`] checks the magic header and walks every block: tags mu=
st be ASCII,
> +/// lengths and padding must fit without overflow, and the byte stream a=
fter `NVFW` must
> +/// be exactly partitionable into blocks (no trailing partial header or =
slack). After
> +/// that, [`TlvIter`] only signals end-of-stream via [`None`], not parse=
 failure.
> +///
> +/// # Invariants
> +///
> +/// `data` is a validated TLV payload (the bytes *after* the `NVFW` magi=
c): it is the exact
> +/// concatenation of zero or more well-formed blocks, with no trailing p=
artial header or slack.
> +/// Consequently, any offset `o` into `data` that is a block boundary an=
d satisfies
> +/// `o < data.len()` is the start of a complete block whose header parse=
s and whose stored
> +/// extent (`TlvBlockHeader::SIZE + header.length.next_multiple_of(4)` b=
ytes) lies within
> +/// `data`. `data.len()` is itself a boundary.
> +#[allow(dead_code)]
> +pub(crate) struct Tlv<'a> {
> +    data: &'a [u8],
> +}
> +
> +#[allow(dead_code)]
> +impl<'a> Tlv<'a> {
> +    const MAGIC: &'static [u8; 4] =3D b"NVFW";
> +
> +    /// Parses `data` as a TLV firmware image, returning [`EINVAL`] if t=
he image is malformed.
> +    pub(crate) fn new(data: &'a [u8]) -> Result<Self> {
> +        // Verify that the magic bytes exist and are the correct value
> +        let magic_len =3D Self::MAGIC.len();
> +        if data
> +            .get(..magic_len)
> +            .is_none_or(|magic| magic !=3D Self::MAGIC)
> +        {
> +            return Err(EINVAL);
> +        }
> +
> +        // The payload is the contiguous sequence of TLV blocks after th=
e magic.
> +        let payload =3D data.get(magic_len..).ok_or(EINVAL)?;
> +
> +        let mut pos =3D 0usize;
> +        while pos < payload.len() {
> +            // Get the next TLV block.
> +            let Some(rest) =3D payload.get(pos..) else {

This check doesn't seem to be needed because the loop constraints it direct=
ly
above, so I'd use let rest =3D &payload[pos..] instead in this case.

> +                return Err(EINVAL);
> +            };
> +            // Validate and extract the header (type, length).
> +            let Some(header) =3D rest
> +                .get(..TlvBlockHeader::SIZE)
> +                .and_then(TlvBlockHeader::parse)
> +            else {
> +                return Err(EINVAL);
> +            };
> +            // The `length` field of a TLV block contains the actual byt=
e length of the
> +            // value, but each TLV block is aligned to a 4-byte boundary=
.
> +            let Some(stored_size) =3D header.length.checked_next_multipl=
e_of(4) else {
> +                return Err(EINVAL);
> +            };
> +            let end =3D pos
> +                .checked_add(TlvBlockHeader::SIZE)
> +                .and_then(|p| p.checked_add(stored_size))
> +                .ok_or(EINVAL)?;
> +            if end > payload.len() {
> +                return Err(EINVAL);
> +            }
> +            pos =3D end;
> +        }
> +
> +        // INVARIANT: the loop above walked `payload` from offset 0 and =
only stopped once `pos`
> +        // reached `payload.len()` exactly, rejecting any block whose he=
ader failed to parse or
> +        // whose stored extent overran. So `payload` is an exact concate=
nation of well-formed
> +        // blocks with no partial header or trailing slack.
> +        Ok(Self { data: payload })
> +    }
> +
> +    fn iter(&self) -> TlvIter<'_, 'a> {
> +        // INVARIANT: 0 is a block boundary, either the start of the fir=
st block,
> +        // or `data.len()` when `data` is empty.
> +        TlvIter { tlv: self, pos: 0 }
> +    }
> +
> +    pub(crate) fn len(&self, tag: &str) -> Result<usize> {
> +        let tlv =3D self.iter().find(|b| b.tag =3D=3D tag).ok_or(EINVAL)=
?;
> +
> +        Ok(tlv.value.len())
> +    }
> +
> +    pub(crate) fn get_bytes(&self, tag: &str) -> Result<&'a [u8]> {
> +        let tlv =3D self.iter().find(|b| b.tag =3D=3D tag).ok_or(EINVAL)=
?;
> +
> +        Ok(tlv.value)
> +    }
> +
> +    pub(crate) fn get_u32(&self, tag: &str) -> Result<u32> {
> +        let tlv =3D self.iter().find(|b| b.tag =3D=3D tag).ok_or(EINVAL)=
?;
> +
> +        tlv.value
> +            .try_into()
> +            .ok()
> +            .map(u32::from_le_bytes)
> +            .ok_or(EINVAL)
> +    }
> +
> +    pub(crate) fn get_string(&self, tag: &str) -> Result<&'a str> {
> +        let tlv =3D self.iter().find(|b| b.tag =3D=3D tag).ok_or(EINVAL)=
?;
> +
> +        // Handle the possibility that the value is null-terminated.
> +        let bytes =3D match CStr::from_bytes_until_nul(tlv.value) {
> +            Ok(cstr) =3D> cstr.to_bytes(),
> +            Err(_) =3D> tlv.value,
> +        };
> +
> +        // But do require it to be all ASCII.
> +        if !bytes.is_ascii() {
> +            return Err(EINVAL);
> +        }
> +
> +        core::str::from_utf8(bytes).map_err(|_| EINVAL)
> +    }

Would it make sense to provide those accessors on TlvBlock, so we don't hav=
e to
create a fresh TlvIter and scan from the start every time?

> +
> +    /// Returns the `n`-th fixed-size chunk from the value of the TLV en=
try matching
> +    /// `tag`.
> +    ///
> +    /// The value is treated as an array of contiguous, equally-sized ch=
unks, each
> +    /// `sig_size` bytes long. `sig_size` is the size of one signature. =
 The returned
> +    /// slice is the `n`-th chunk.
> +    ///
> +    /// Returns [`EINVAL`] if no entry matches `tag`, if computing the c=
hunk's offset
> +    /// overflows, or if the value is too short to contain the requested=
 chunk.
> +    pub(crate) fn get_nth_chunk(&self, tag: &str, sig_size: usize, n: us=
ize) -> Result<&'a [u8]> {
> +        let sigs =3D self
> +            .iter()
> +            .find(|b| b.tag =3D=3D tag)
> +            .map(|b| b.value)
> +            .ok_or(EINVAL)?;
> +
> +        let start =3D sig_size.checked_mul(n).ok_or(EINVAL)?;
> +        let end =3D start.checked_add(sig_size).ok_or(EINVAL)?;
> +
> +        sigs.get(start..end).ok_or(EINVAL)
> +    }
> +}
> --=20
> 2.54.0

