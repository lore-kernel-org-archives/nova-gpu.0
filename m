Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2ED634DB56
	for <nova-gpu@lists.linux.dev>; Mon, 22 Jun 2026 20:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782159989; cv=none; b=dPHzgHR9/Y/IH+hirLkAGJM6H97h+NEs/d0q6VZy0Rpj++dnpCakiAnQ1vTiGBt9YwEkZg54E1oWZsVO3LKjZMJmauRJbPDHDwaXN0S7IqqXmO5KnbyC+/dyFV3d8do8M2nN8RZcWmGrqyz6/Ayhkou9hsEqasS/XggQJjvpsMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782159989; c=relaxed/simple;
	bh=j3rtFNPBLmi5wrMWIy8CM0nRpvZmWLURX4bwHguEMtE=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=HFe0R8NY2wJzcqA601/QcZ8Uk1T0kpis+jdjYX5tMag+EcK50rZt1JK41YLAZ2+p3O7iLw0CBRmJ36lhI3chsbA9Sqbp8cnJYC8D2bIbosofT72GanMI9pqV7mgMXpvylvwBJ70N+len4gUY4J+aNbO9zz6EBx9uN5MvOvnWkTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gnK0gxux; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gnK0gxux"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30c52cc5285so964839eec.1
        for <nova-gpu@lists.linux.dev>; Mon, 22 Jun 2026 13:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782159986; x=1782764786; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKjdclokDyRi4PBBx/vJlxGysKebeIHY7C6D9/WXUIk=;
        b=gnK0gxuxnyPE6ZmoTa9PHAgCPABhz6pixPSr3/KsTPgEDpRRbBF7lZqEiHaz+fXQ1d
         WE76v7RyMqmW/N9Vx2f1/cKhP3uN1cdS3Wb4fCztpbN4hXh8QDlt4TIuOxUoLk4bPNXx
         VpJ96BNBDQoZm6vsdJxDctPgMac2nn7u9Y5l0hrQEIDgndUrjTKo6lc6wGbEmeaUzkq7
         UO2rLgteC2ruIyqJ0wCsWp2gn40JF66H3JPFBruEh4l/Ap17W31zLZCuE6i1ddMYgKf8
         1s6FacrWcWQ++yyq6/RZT3Gj98jR2fYQ4Sas10wRqqa4osqKYCaIWCCoppyKyXfEEQTU
         a46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782159986; x=1782764786;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xKjdclokDyRi4PBBx/vJlxGysKebeIHY7C6D9/WXUIk=;
        b=ITbwcRPZi11EFeFzrAgk1LoKsAUjzGZAABGIJkoMU2uLjjW6ju8jc0xNIUhaWWr18F
         HVxWFuV1jILzGn2QFh5R2eTLJryn2KCXJI4PpWV6tHOvojBcBb6bhJOUqkxBfQR7svc6
         1nZgrmEnhcyr5m9+iHC5YJyQRcbrazmTAYiaQhkzqqXpfn/X5kknKXvBs+h0z/jSpAGJ
         guY6TxqUCavS1PEqwRgCoRWdNfiq1Q3GGNutyfSUSSwKQXrktP8/iEFdaIjyEpuc0S79
         MVeXSlD0grjlHmI9SOO5/1waiUAL0qVP4aLm3RbZCOja9Wodd56viZFn8eXog63P55xg
         tMLw==
X-Forwarded-Encrypted: i=1; AHgh+Rr4wkODYSwYBB0C7SmTQIqN7BcD6xq7rtQcXEOipNt1tBvTekf0FHTLCJNSVxZNImuIKQbmA1XPuw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwvdwO2P2BAV1tqp4jlDTBNsEbVazRNK8mtVhGOnBj9uaRFDDD4
	qtKwpjDjFt0dQNUbl+VAX1TX7kTTQ9+5aEVpuJkAYNVANdyY+MYvuUY=
X-Gm-Gg: AfdE7cnBn1aGYtZzsPMw20aI944x5J2XFp2qTgYm9R+BYEfFGUI4W+yUmwFCbbUQWkj
	q4OaztI+wm0Mg4N7SyCKCzh7lLbGTgqOVv0x0W8tdYiFMrOH9gsnRNR5J2xfu3xgH/GhvwqBTZe
	HXX0xrvBG5r+SZLKMTr1Yk/eaznlapp2Pl7o2hPSKwfR1wsPnkEb/F4VYWw2PUExvfDhXADTPCi
	eorrnX54QqgNio3un4+1iDxSQdMWxEZ3QFJTKOajI6nRUhpyse5Hq7l5woUc+8AITFhyxF5YEfw
	SVz8qEweBzMntO9bvZLmW2Wty7Ui9kz+81I7qtXQlFlcNroEbgJdk9TqTuae0+DFc+tk29rkKvq
	MsaOk4vVIIEuKkRiYbLicudwx4B6W7yyLUgudlkC9Hgvc8oFpcgVXnghcODrXmZ3AplyAFPUYj3
	T56U7tRs8p3TcC2ut9dbd4IKQl65w7PG83IdOiHC+/JodEnGho
X-Received: by 2002:a05:7301:678c:b0:304:54d6:20f3 with SMTP id 5a478bee46e88-30c06d4b6c2mr10129817eec.4.1782159985738;
        Mon, 22 Jun 2026 13:26:25 -0700 (PDT)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1ba1f137sm10798710eec.1.2026.06.22.13.26.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 13:26:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Jun 2026 17:26:19 -0300
Message-Id: <DJFUZJYZHOT1.M74T83PJE8GM@gmail.com>
To: "Alistair Popple" <apopple@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alexandre
 Courbot" <acourbot@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Shuah
 Khan" <skhan@linuxfoundation.org>, "Simona Vetter" <simona@ffwll.ch>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "Tamir Duberstein" <tamird@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-kernel@vger.kernel.org>, <linux-kernel-mentees@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>
Subject: Re: [PATCH] gpu: nova-core: parse structs via zerocopy
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
X-Mailer: aerc 0.20.0
References: <20260621143647.264770-1-nico.antinori.7@gmail.com>
 <ajjj1yyMcrCA8H19@nvdebian.thelocal>
In-Reply-To: <ajjj1yyMcrCA8H19@nvdebian.thelocal>

Hello Alistair,

On Mon Jun 22, 2026 at 4:45 AM -03, Alistair Popple wrote:
> On 2026-06-22 at 00:36 +1000, Nicol=C3=A1s Antinori <nico.antinori.7@gmai=
l.com> wrote...
>> Replace the unsafe `kernel::transmute::FromBytes` trait implementation
>> for the `FalconUCodeDescV3`, `PcirStruct`, `BitHeader`, `NpdeStruct`,
>> and `PmuLookupTableHeader` structs with the derivable
>> `zerocopy::FromBytes` trait.
>>=20
>> This change eliminates the manual unsafe implementations in favor of a
>> derivable trait. When this trait is derived, validity checks are
>> performed at compile time to make sure that the type can safely
>> implement `FromBytes`.
>
> Nice, this looks good although due to some code movement this doesn't com=
pile
> when applied to drm-rust-next[1]. Would you mind rebasing on top of that?=
 The
> changes required should be relatively straight forward, they are mostly t=
he
> result of some new users of transmute::FromBytes being added to vbios.rs.

I did my work on rust-next [1] because drm-rust-next does not have the
zerocopy crate present yet [2]. linux-next contains both zerocopy [3]=20
and the new users of transmute::FromBytes if I am not mistaken (BitToken,
PciRomHeader, and PmuLookupTableEntry), so I can make the changes there.

I got confused because the issue was originally in the rust-for-linux=20
tree. Since zerocopy wasn't in drm-rust-next yet, I wrongly assumed the=20
work should happen there and that drm-rust-next would eventually pull=20
them in.

I am fairly new to kernel development, I apologize for the mix-up.

>
> Also what is you plan here? I have also been looking at some of these
> conversions, specifically those involving the generated bindings. Really
> appreciate your contributions, so no problem if you want to continue with=
 some
> of the conversions, just want to make sure we aren't duplicating effort h=
ere.

I would be happy to handle the remaining conversions! I can send a v2 patch
that includes those as well.

Thank you

[1] https://github.com/Rust-for-Linux/linux/tree/rust-next/rust
[2] https://gitlab.freedesktop.org/drm/rust/kernel/-/tree/drm-rust-next/rus=
t
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tre=
e/rust

>
>  - Alistair
>
> [1] - https://gitlab.freedesktop.org/drm/rust/kernel/-/tree/drm-rust-next
>
>> Link: https://github.com/Rust-for-Linux/linux/issues/1241
>> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
>> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>
>> ---
>> NOTE: Compile-tested only. I don't own a piece of hardware where I can
>> test the nova driver.
>>=20
>>  drivers/gpu/nova-core/firmware.rs |  6 +----
>>  drivers/gpu/nova-core/vbios.rs    | 38 ++++++++-----------------------
>>  2 files changed, 11 insertions(+), 33 deletions(-)
>>=20
>> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/f=
irmware.rs
>> index ad37994ac15a..0afd1d3fe5ad 100644
>> --- a/drivers/gpu/nova-core/firmware.rs
>> +++ b/drivers/gpu/nova-core/firmware.rs
>> @@ -86,7 +86,7 @@ pub(crate) struct FalconUCodeDescV2 {
>>=20
>>  /// Structure used to describe some firmwares, notably FWSEC-FRTS.
>>  #[repr(C)]
>> -#[derive(Debug, Clone)]
>> +#[derive(Debug, Clone, FromBytes)]
>>  pub(crate) struct FalconUCodeDescV3 {
>>      /// Header defined by `NV_BIT_FALCON_UCODE_DESC_HEADER_VDESC*` in O=
penRM.
>>      hdr: u32,
>> @@ -117,10 +117,6 @@ pub(crate) struct FalconUCodeDescV3 {
>>      _reserved: u16,
>>  }
>>=20
>> -// SAFETY: all bit patterns are valid for this type, and it doesn't use
>> -// interior mutability.
>> -unsafe impl FromBytes for FalconUCodeDescV3 {}
>> -
>>  /// Enum wrapping the different versions of Falcon microcode descriptor=
s.
>>  ///
>>  /// This allows handling both V2 and V3 descriptor formats through a
>> diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbio=
s.rs
>> index 8b7d17a24660..754812bcbdde 100644
>> --- a/drivers/gpu/nova-core/vbios.rs
>> +++ b/drivers/gpu/nova-core/vbios.rs
>> @@ -13,11 +13,8 @@
>>          Alignment, //
>>      },
>>      sync::aref::ARef,
>> -    transmute::FromBytes,
>>  };
>>=20
>> -use zerocopy::FromBytes as _;
>> -
>>  use crate::{
>>      driver::Bar0,
>>      firmware::{
>> @@ -301,7 +298,7 @@ pub(crate) fn fwsec_image(&self) -> &FwSecBiosImage =
{
>>  }
>>=20
>>  /// PCI Data Structure as defined in PCI Firmware Specification
>> -#[derive(Debug, Clone)]
>> +#[derive(Debug, Clone, FromBytes)]
>>  #[repr(C)]
>>  struct PcirStruct {
>>      /// PCI Data Structure signature ("PCIR" or "NPDS")
>> @@ -330,12 +327,9 @@ struct PcirStruct {
>>      max_runtime_image_len: u16,
>>  }
>>=20
>> -// SAFETY: all bit patterns are valid for `PcirStruct`.
>> -unsafe impl FromBytes for PcirStruct {}
>> -
>>  impl PcirStruct {
>>      fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
>> -        let (pcir, _) =3D PcirStruct::from_bytes_copy_prefix(data).ok_o=
r(EINVAL)?;
>> +        let (pcir, _) =3D PcirStruct::read_from_prefix(data).map_err(|_=
| EINVAL)?;
>>=20
>>          // Signature should be "PCIR" (0x52494350) or "NPDS" (0x5344504=
e).
>>          if &pcir.signature !=3D b"PCIR" && &pcir.signature !=3D b"NPDS"=
 {
>> @@ -371,7 +365,7 @@ fn image_size_bytes(&self) -> usize {
>>  /// This is the head of the BIT table, that is used to locate the Falco=
n data. The BIT table (with
>>  /// its header) is in the [`PciAtBiosImage`] and the falcon data it is =
pointing to is in the
>>  /// [`FwSecBiosImage`].
>> -#[derive(Debug, Clone, Copy)]
>> +#[derive(Debug, Clone, Copy, FromBytes)]
>>  #[repr(C)]
>>  struct BitHeader {
>>      /// 0h: BIT Header Identifier (BMP=3D0x7FFF/BIT=3D0xB8FF)
>> @@ -390,12 +384,9 @@ struct BitHeader {
>>      checksum: u8,
>>  }
>>=20
>> -// SAFETY: all bit patterns are valid for `BitHeader`.
>> -unsafe impl FromBytes for BitHeader {}
>> -
>>  impl BitHeader {
>>      fn new(data: &[u8]) -> Result<Self> {
>> -        let (header, _) =3D BitHeader::from_bytes_copy_prefix(data).ok_=
or(EINVAL)?;
>> +        let (header, _) =3D BitHeader::read_from_prefix(data).map_err(|=
_| EINVAL)?;
>>=20
>>          // Check header ID and signature
>>          if header.id !=3D 0xB8FF || &header.signature !=3D b"BIT\0" {
>> @@ -533,7 +524,7 @@ fn new(dev: &device::Device, data: &[u8]) -> Result<=
Self> {
>>  /// PCI Data Structure. It contains some fields that are redundant with=
 the PCI Data Structure, but
>>  /// are needed for traversing the BIOS images. It is expected to be pre=
sent in all BIOS images
>>  /// except for NBSI images.
>> -#[derive(Debug, Clone)]
>> +#[derive(Debug, Clone, FromBytes)]
>>  #[repr(C)]
>>  struct NpdeStruct {
>>      /// 00h: Signature ("NPDE")
>> @@ -548,12 +539,9 @@ struct NpdeStruct {
>>      last_image: u8,
>>  }
>>=20
>> -// SAFETY: all bit patterns are valid for `NpdeStruct`.
>> -unsafe impl FromBytes for NpdeStruct {}
>> -
>>  impl NpdeStruct {
>>      fn new(dev: &device::Device, data: &[u8]) -> Option<Self> {
>> -        let (npde, _) =3D NpdeStruct::from_bytes_copy_prefix(data)?;
>> +        let (npde, _) =3D NpdeStruct::read_from_prefix(data).ok()?;
>>=20
>>          // Signature should be "NPDE" (0x4544504E).
>>          if &npde.signature !=3D b"NPDE" {
>> @@ -845,6 +833,7 @@ fn new(data: &[u8]) -> Result<Self> {
>>  }
>>=20
>>  #[repr(C)]
>> +#[derive(FromBytes)]
>>  struct PmuLookupTableHeader {
>>      version: u8,
>>      header_len: u8,
>> @@ -852,9 +841,6 @@ struct PmuLookupTableHeader {
>>      entry_count: u8,
>>  }
>>=20
>> -// SAFETY: all bit patterns are valid for `PmuLookupTableHeader`.
>> -unsafe impl FromBytes for PmuLookupTableHeader {}
>> -
>>  /// The [`PmuLookupTableEntry`] structure is used to find the [`PmuLook=
upTableEntry`] for a given
>>  /// application ID.
>>  ///
>> @@ -867,7 +853,7 @@ struct PmuLookupTable {
>>=20
>>  impl PmuLookupTable {
>>      fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
>> -        let (header, _) =3D PmuLookupTableHeader::from_bytes_copy_prefi=
x(data).ok_or(EINVAL)?;
>> +        let (header, _) =3D PmuLookupTableHeader::read_from_prefix(data=
).map_err(|_| EINVAL)?;
>>=20
>>          let header_len =3D usize::from(header.header_len);
>>          let entry_len =3D usize::from(header.entry_len);
>> @@ -1013,15 +999,11 @@ pub(crate) fn header(&self) -> Result<FalconUCode=
Desc> {
>>          let data =3D self.base.data.get(falcon_ucode_offset..).ok_or(EI=
NVAL)?;
>>          match ver {
>>              2 =3D> {
>> -                let v2 =3D FalconUCodeDescV2::read_from_prefix(data)
>> -                    .map_err(|_| EINVAL)?
>> -                    .0;
>> +                let (v2, _) =3D FalconUCodeDescV2::read_from_prefix(dat=
a).map_err(|_| EINVAL)?;
>>                  Ok(FalconUCodeDesc::V2(v2))
>>              }
>>              3 =3D> {
>> -                let v3 =3D FalconUCodeDescV3::from_bytes_copy_prefix(da=
ta)
>> -                    .ok_or(EINVAL)?
>> -                    .0;
>> +                let (v3, _) =3D FalconUCodeDescV3::read_from_prefix(dat=
a).map_err(|_| EINVAL)?;
>>                  Ok(FalconUCodeDesc::V3(v3))
>>              }
>>              _ =3D> {
>> --
>> 2.47.3
>>=20

