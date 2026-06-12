Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1671306764
	for <nova-gpu@lists.linux.dev>; Fri, 12 Jun 2026 18:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781289998; cv=none; b=Cvo5hZS1/3PvWQ4S9u/vMdsxPlZN7jbR5IYaY7yKahkbeHy5230YJQZ824rY81Lbeg2zaWsZUhYJUMbAlqM4KmQY0s0Vih/HxU/Xfy3Ctkzz8r8xGeNQLntYhdxtV+zxPMBKe8psFREnuvxXjunjTW9IX1h06+0SxZkZbZ7Gho4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781289998; c=relaxed/simple;
	bh=emb9rRfXOXM+jlW31erLgvwq6s8LjUgxBBxHkVxY+Z0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qZRFTiEIf6FKRUs7BA9RCw+48xEEpl0iN2KLXyyB9zPR71Pl7mxlrh90TgpQ9wf/BlAa/gK0XqkZ306N4nSwrBn+SnSDch9h01F/QX2YJ/LDtZEI25WO5s19Whyv++NpiawgzCdZN/ljylbEIh8/zob41B4tgvVqMRlttL6wk0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=F4WD5dX2; arc=none smtp.client-ip=109.224.244.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="F4WD5dX2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1781289993; x=1781549193;
	bh=R8haDRoZsIwV0Nie+PPjWxlOW3JZIRNWVYy6kx6uxb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=F4WD5dX2G+6XazFlsfLzIEwRaNOXMKcTcEZLWGe05KcNnuEHwEv9858ywxQd2Kugl
	 pkJcIAjkEBOKvDN1OcKDdycyf4NhM8YM39WdqfVn9Tw4X5NhGOw0d331wOpwl0+lix
	 fS4wBt++IUlaPKRtx/PAwh5FtILLYrVz7voOHxjhiGOZHiEILGYh4eZu1+4woykKGY
	 EdYMBtXwXlcPWtDDdL9YluRth7RRCPVNs2K0+lF34hZHFlElxXIoN9ALeXxwB7JUsb
	 RZ8FDSHwHAIZFnmz/ZjSNdBKrNfgw38Xlb9mB11mHjegSatkdjEAKX3zrT/fXlXO5o
	 RIO8d0lOWv52Q==
X-Pm-Submission-Id: 4gcT4h42v9z1DF7l
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Gary Guo <gary@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: Re: [PATCH] gpu: nova-core: remove `#[allow(non_snake_case)]`
Date: Fri, 12 Jun 2026 21:46:25 +0300
Message-ID: <20260612184626.291171-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260612123401.2684025-1-gary@kernel.org>
References: <20260612123401.2684025-1-gary@kernel.org>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 12 Jun 2026 13:34:00 +0100=0D
Gary Guo <gary@kernel.org> wrote:=0D
=0D
> From: Gary Guo <gary@garyguo.net>=0D
> =0D
> Since commit 5423ef9d4db8 ("rust: pin-init: internal: suppress=0D
> `non_snake_case` lint in `[pin_]init!`"), mere use of the non-snake-case=
=0D
> identifiers would not cause the warning to be generated. Thus remove thes=
e=0D
> allows.=0D
> =0D
> Signed-off-by: Gary Guo <gary@garyguo.net>=0D
> ---=0D
> This should be applied after the merge window when v7.2-rc1 is backmerged=
=0D
> to drm-rust-next tree, so the pin-init changes are picked up.=0D
> ---=0D
>  drivers/gpu/nova-core/gsp/fw.rs          | 8 --------=0D
>  drivers/gpu/nova-core/gsp/fw/commands.rs | 2 --=0D
>  2 files changed, 10 deletions(-)=0D
> =0D
> diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/=
fw.rs=0D
> index 4db0cfa4dc4d..d96ea0b216b4 100644=0D
> --- a/drivers/gpu/nova-core/gsp/fw.rs=0D
> +++ b/drivers/gpu/nova-core/gsp/fw.rs=0D
> @@ -219,7 +219,6 @@ pub(crate) fn new<'a>(=0D
>          gsp_firmware: &'a GspFirmware,=0D
>          fb_layout: &'a FbLayout,=0D
>      ) -> impl Init<Self> + 'a {=0D
> -        #[allow(non_snake_case)]=0D
>          let init_inner =3D init!(bindings::GspFwWprMeta {=0D
>              // CAST: we want to store the bits of `GSP_FW_WPR_META_MAGIC=
` unmodified.=0D
>              magic: bindings::GSP_FW_WPR_META_MAGIC as u64,=0D
> @@ -674,7 +673,6 @@ fn id8(name: &str) -> u64 {=0D
>              u64::from_ne_bytes(bytes)=0D
>          }=0D
>  =0D
> -        #[allow(non_snake_case)]=0D
>          let init_inner =3D init!(bindings::LibosMemoryRegionInitArgument=
 {=0D
>              id8: id8(name),=0D
>              pa: obj.dma_handle(),=0D
> @@ -793,7 +791,6 @@ impl GspMsgElement {=0D
>      /// * `sequence` - Sequence number of the message.=0D
>      /// * `cmd_size` - Size of the command (not including the message el=
ement), in bytes.=0D
>      /// * `function` - Function of the message.=0D
> -    #[allow(non_snake_case)]=0D
>      pub(crate) fn init(=0D
>          sequence: u32,=0D
>          cmd_size: usize,=0D
> @@ -876,7 +873,6 @@ pub(crate) struct GspArgumentsCached {=0D
>  impl GspArgumentsCached {=0D
>      /// Creates the arguments for starting the GSP up using `cmdq` as it=
s command queue.=0D
>      pub(crate) fn new(cmdq: &Cmdq) -> impl Init<Self> + '_ {=0D
> -        #[allow(non_snake_case)]=0D
>          let init_inner =3D init!(bindings::GSP_ARGUMENTS_CACHED {=0D
>              messageQueueInitArguments <- MessageQueueInitArguments::new(=
cmdq),=0D
>              bDmemStack: 1,=0D
> @@ -923,7 +919,6 @@ unsafe impl FromBytes for GspArgumentsPadded {}=0D
>  =0D
>  impl MessageQueueInitArguments {=0D
>      /// Creates a new init arguments structure for `cmdq`.=0D
> -    #[allow(non_snake_case)]=0D
>      fn new(cmdq: &Cmdq) -> impl Init<Self> + '_ {=0D
>          init!(MessageQueueInitArguments {=0D
>              sharedMemPhysAddr: cmdq.dma_handle,=0D
> @@ -947,7 +942,6 @@ pub(crate) enum GspDmaTarget {=0D
>  =0D
>  impl GspAcrBootGspRmParams {=0D
>      fn new(target: GspDmaTarget, wpr_meta_addr: u64) -> impl Init<Self> =
{=0D
> -        #[allow(non_snake_case)]=0D
>          let params =3D init!(Self {=0D
>              target: target as u32,=0D
>              gspRmDescSize: num::usize_into_u32::<{ size_of::<GspFwWprMet=
a>() }>(),=0D
> @@ -966,7 +960,6 @@ fn new(target: GspDmaTarget, wpr_meta_addr: u64) -> i=
mpl Init<Self> {=0D
>  =0D
>  impl GspRmParams {=0D
>      fn new(target: GspDmaTarget, libos_addr: u64) -> impl Init<Self> {=0D
> -        #[allow(non_snake_case)]=0D
>          let params =3D init!(Self {=0D
>              target: target as u32,=0D
>              bootArgsOffset: libos_addr,=0D
> @@ -986,7 +979,6 @@ unsafe impl FromBytes for GspFmcBootParams {}=0D
>  =0D
>  impl GspFmcBootParams {=0D
>      pub(crate) fn new(wpr_meta_addr: u64, libos_addr: u64) -> impl Init<=
Self> {=0D
> -        #[allow(non_snake_case)]=0D
>          let init =3D init!(Self {=0D
>              // Blackwell FSP obtains WPR info from other sources, so=0D
>              // wprCarveoutOffset and wprCarveoutSize are left zero.=0D
> diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-=
core/gsp/fw/commands.rs=0D
> index 7bcc41fc7fa0..6c31d825b746 100644=0D
> --- a/drivers/gpu/nova-core/gsp/fw/commands.rs=0D
> +++ b/drivers/gpu/nova-core/gsp/fw/commands.rs=0D
> @@ -27,7 +27,6 @@ pub(crate) struct GspSetSystemInfo {=0D
>  =0D
>  impl GspSetSystemInfo {=0D
>      /// Returns an in-place initializer for the `GspSetSystemInfo` comma=
nd.=0D
> -    #[allow(non_snake_case)]=0D
>      pub(crate) fn init<'a>(=0D
>          dev: &'a pci::Device<device::Bound>,=0D
>          chipset: Chipset,=0D
> @@ -99,7 +98,6 @@ pub(crate) struct PackedRegistryTable {=0D
>  }=0D
>  =0D
>  impl PackedRegistryTable {=0D
> -    #[allow(non_snake_case)]=0D
>      pub(crate) fn init(num_entries: u32, size: u32) -> impl Init<Self> {=
=0D
>          type InnerPackedRegistryTable =3D bindings::PACKED_REGISTRY_TABL=
E;=0D
>          let init_inner =3D init!(InnerPackedRegistryTable {=0D
> =0D
> base-commit: 614f7220e548a8df6262887c0140d9267841dbc1=0D
> -- =0D
> 2.54.0=0D
> =0D
=0D
Reviewed-by: Onur =C3=96zkan <work@onurozkan.dev>=0D
