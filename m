Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011058.outbound.protection.outlook.com [40.107.208.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABEE43CE54
	for <nova-gpu@lists.linux.dev>; Thu, 20 Aug 2026 12:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787229043; cv=fail; b=erEXqMIl3xeL4ZQmEywsTVNP9/FX0YBBWtjFzn7Vqe8Gha4/cVHI/1TRnw2if7+S+vK/aHTPHAJrrmzimWvwspLxZW/oCEZ2SCKxrdYSSDkA3EYbQyztGHEIYvtPb+/SWj53A3V26Z08gC75s5vgxLFZb6aB27TzOsiGUaP5c+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787229043; c=relaxed/simple;
	bh=pZrRWdz5o4FiPop1CA/kBN9y5gPBMBw8sQ5vcNye6Mg=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DYzax8TDNd83/8A3+OBivPVxMOPDE1LGOf0Gwt6V0aNMStdhfObW/ctKWpQmKGgCV1sqmq1ZTh6nhb+PQ/0Qq1ftqkZ0Pp4q48bw/N2oM0j+c0xihBK3IeRDFyQ6gwoqcdL+0X+oludZzQE5YVTtsIzhQbQvfMq83W1Ysk0eXgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZaB36Lp2; arc=fail smtp.client-ip=40.107.208.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZaB36Lp2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FuAJypkSkEgcR8a8Z2qJIQ+PHlDamwvDqNS1HOioZXrMYPNh03iAUGEaZUHjp5y1W7wwNW7m4RdBbDXqCllK8L6TK5oqTckmjb+fT64QYo3nHWxFVGzqn8nSikBoASBo8Xx2IONxnOKuoXv/8JzzvBuXojP6pdAIt757jChZtni1e6UuiyaJ9QPi0fh+fRIzM6wK9126bnTJe0OWmn2pKVZcayEuwBp2pZI/elu6b8yXCp2eCpxvPi/0x4M8yVPiwiN87lJ2ES63tWu+cx+60OsmjHdGn6/yFOLXSKseKK5+NcTMPzrq37XU6ZUeB9iwpra+3D86J9YmEpbLjhOOYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DjodA5LasNjarWN/0mk0b0n4pzD/VK8+vjeaWggwtRY=;
 b=gCDyx6mbowNs6wziOvWjdGER2eb/7RYhHsOd57z/5w3dI1cJOKABtjZC4Nimn6i4VU6zxRcULTFgb6zDrtv/EHfYzn11vDL3kWy6l+9lzqRBzutM5LkLldOKSc5pNctr4UXcA/5f5c/oHgS9BHj0a5GB7oV3gFB63VeYgVRae9PLCrVGKlFbN0tHpr/gw9WYXGJMM1jlu1Kb21dGINnRvAi4UiGSYoGwSStPwbqkFKGfE26Q84kTMTYblnJo5PDvcvqJ1xNsZ0FfXp8X6PTD2dSuDlD+YQq+HPnNpHUWS4rTqVurzQJm/ZQKJW3JPmtcb4LeiZfV4Vrjyd+qHFWwTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=umich.edu smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DjodA5LasNjarWN/0mk0b0n4pzD/VK8+vjeaWggwtRY=;
 b=ZaB36Lp2O2u+/NXKwGLj6S7R2+bFQt5AEO/RPxZJEpYKK/wYNULl7hC+xOc0VYKMC92dadH/MM9R6Q+RYdXQ3Z5XtdhJIlCB9yjGj1i4M1IbYp30oyTW6q/6WsLoi/3aVqzfqDF7fO3zoQyQWKqNRM6z8mz0WGbtazP0/DpYrlki/5laGxAaRr+VUoJnAw9g2cH6uYsAsAqFCPsptAeeke28sVz06D9M6uhBfVLm2yqba77G3dtoJ6+rz9QaVd+0sQ8UuMXnhdBC02Uj0TN4s1FsjX982hqMkiC+kiqBKgt6g6JzrqqogJTfErh/Sx7oBozcU5fwf+i6Xf049+yVbA==
Received: from SJ0PR03CA0223.namprd03.prod.outlook.com (2603:10b6:a03:39f::18)
 by SA0PR12MB4429.namprd12.prod.outlook.com (2603:10b6:806:73::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Thu, 20 Aug
 2026 12:30:36 +0000
Received: from SJ1PEPF000023D9.namprd21.prod.outlook.com
 (2603:10b6:a03:39f:cafe::8f) by SJ0PR03CA0223.outlook.office365.com
 (2603:10b6:a03:39f::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.9 via Frontend Transport; Thu, 20
 Aug 2026 12:30:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF000023D9.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.0 via Frontend Transport; Thu, 20 Aug 2026 12:30:35 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 20 Aug
 2026 05:30:14 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 20 Aug
 2026 05:30:13 -0700
Received: from inno-dell (10.127.8.12) by mail.nvidia.com (10.129.68.7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46 via Frontend
 Transport; Thu, 20 Aug 2026 05:30:08 -0700
Date: Thu, 20 Aug 2026 15:30:06 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>
CC: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Alistair Popple
	<apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas
	<bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
	<alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
	<gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?= Roy Baron
	<bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, "Trevor
 Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, LKML
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 17/27] gpu: nova-core: gsp: add GMC dispatch on receive
Message-ID: <20260820153006.5ae7e7e4@inno-dell>
In-Reply-To: <20260819035221.336390-18-jhubbard@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
	<20260819035221.336390-18-jhubbard@nvidia.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D9:EE_|SA0PR12MB4429:EE_
X-MS-Office365-Filtering-Correlation-Id: 380f2242-ba1f-4c6d-9329-08defeb6d59a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|36860700016|82310400026|6133799003|4143699003|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	SiJL5ShPxJIg/ra+nM70cpaNp8Exlqa0V0R7aq0snrlJhDtoAGnGIQb72bi6Pr+Db+pBJmVSwfiZN+Y/D3hbOoc6RaZd/EyCiHn0ZUa9wVjalEZvQkEc1/HdaHa43h/Xn/1Ii1EYtMvn9RgR/EIojhLLl+cuKvTAxpBVjMa7MM4EoStl8FTDH8qGpRPBuTR9aB5qB6oLRIOFH1dJ1wX2Tq/X7GZjbaUQySM81bNO4M+D1VoyVKJx+84fFEHLxUMlKgRR5oSEUWYdMpf0g/o58jmPKiFYiAM9+xBE7L2atjP/HRP/8GHHSY00/o4S6Jn47cqudWuT4D2+WnhJ1D1Ooy4HAJ8FgGuBOyWn6B2kC0G0FU1YlqLOWq/kmRr5zwXEa2wRUQn09iJafPIGuDOLlVdt+bD+ItefjeyjDlMK8oai9435PAVqt8mB9NxQ/ehzHOosNZhhAoa8dIGnWy9E/x0sS31u2l/EUVPvqUzMYs2BpZDPkB/o4TnHtuZAbtsL1s8hu/XhmQDTEF9AGWiT3XACWRwOuUmjjZAoiSh3ekRqQDLcx2GwhciW/p5r3oRplTzzMmMXHLNt0WVAe5eDuaZJAamZWNVSaL0sS8C+xUcJEZAWLrTC+tjQjiJ2NJxfoAn4vv5ZO2a7XJggHnaHVuisSycOq+IsKsEvVeFinmhUj9OyOb9LZTJt18mQUfD5hC9atEZ1u4McbudRdo7/BA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(36860700016)(82310400026)(6133799003)(4143699003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IlrtaBgrHYnPpwtBR/AB6uxulKjUKhSP5PGW12myN+xuX5U5/t5km0uKlCvUOeKJ/0ZfGRBfkoZEFTZRG60zeGk70N7nS2l/69qnv0aEyRIqwWBKfg2yi7VeaDWltRU47Zua0rQBwUNOr/E8qaDvLSaAF+OmQpbb3GaSnZhCNnNU8fSJ5RYugBxR8SO/uElAmTKIUE+7Ma1Prpv6XspsVXbjBl8bbyOcAk0cgcFqUBAesqsILLa/kDtNRi0C4lbtfq7gqXGB1K9ZIH8SjiIYdDMbRIWAqxy9UhxQkP8R0Ll6+FBCzjvEQ2Db1pcTElaAjLylaFDjU1led+ZKhY9LCA8AI2VWy/Yqdvf6gm80652NfXdmoVSX10BrOFHIKAYT/l/pO6IMhQnzZWpotRbiht3SIYYqD0sx5Pvt3Cob8/fNYBVrSOZNBLwvTaRvk5js
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 12:30:35.4106
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 380f2242-ba1f-4c6d-9329-08defeb6d59a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4429

On Tue, 18 Aug 2026 20:52:10 -0700
John Hubbard <jhubbard@nvidia.com> wrote:

> The r000 boot path delivers the load-and-execute steps as GMC events
> keyed by command id, where the RPC path keys on a function code, so
> the boot loop needs its own dispatch.
snip

> +    fn receive_gmc_and_dispatch<R>(
> +        &mut self,
> +        timeout: Delta,
> +        handler: impl FnOnce(u32, &[u8], &[u8]) -> Option<R>,
> +    ) -> Result<Option<R>> {
> +        let message = self.wait_for_gmc_msg(timeout)?;
> +        let header = message.header;
> +        let length = header.length();
> +
> +        // The RPC and GMC elements share every field through
> `nvdm_header`, so `gmc` holds an
> +        // RPC header rather than a GMC one unless the NVDM type
> says otherwise.
> +        let result = if header.is_gmc_api() {
> +            let command_id = header.gmc.command_id();
> +

IMO, should we check header.gmc.size == payload_length()? as now we
know it is a GMC message now. Not sure if gmc.size < payload_length()
is a valid use case.

> +            dev_dbg!(
> +                &self.dev,
> +                "GSP GMC: event: seq# {}, command_id=0x{:x},
> length=0x{:x}\n",
> +                header.gmc.sequence,
> +                command_id,
> +                length,
> +            );
> +
> +            handler(command_id, message.contents.0,
> message.contents.1)
> +        } else {
> +            dev_warn!(&self.dev, "GSP GMC: dropping non-GMC queue
> element\n");
> +            None
> +        };
> +
> +        self.gsp_mem
> +
> .advance_cpu_read_ptr(u32::try_from(length.div_ceil(GSP_PAGE_SIZE))?);
> +
> +        Ok(result)
> +    }
>  }
> diff --git a/drivers/gpu/nova-core/gsp/fw.rs
> b/drivers/gpu/nova-core/gsp/fw.rs index 9e6b5ec6aadb..83f7d2042aa1
> 100644 --- a/drivers/gpu/nova-core/gsp/fw.rs
> +++ b/drivers/gpu/nova-core/gsp/fw.rs
> @@ -975,8 +975,19 @@ pub(crate) struct GmcApiHeader {
>      reserved: [u32; 5],
>  }
>  
> +/// Command identifier bits of [`GmcApiHeader::command`], matching
> Open RM's +/// `GMCAPI_HEADER_COMMAND_ID_MASK`. The remaining byte
> carries flags. +const GMCAPI_COMMAND_ID_MASK: u32 = 0x00ff_ffff;
> +
>  static_assert!(size_of::<GmcApiHeader>() == 40);
>  
> +impl GmcApiHeader {
> +    /// Returns the command identifier, without the flag byte.
> +    pub(crate) fn command_id(&self) -> u32 {
> +        self.command & GMCAPI_COMMAND_ID_MASK
> +    }
> +}
> +
>  // SAFETY: All fields are integer types with no uninitialized
> padding bytes. unsafe impl AsBytes for GmcApiHeader {}
>  
> @@ -1070,6 +1081,15 @@ pub(crate) fn has_valid_magic(&self) -> bool {
>          self.mctp_magic == MCTP_MAGIC
>      }
>  
> +    /// Returns `true` if the NVDM header routes this element to the
> GSP's GMC dispatch.
> +    ///
> +    /// A [`GspMsgElement`] and a [`GspGmcMsgElement`] share every
> field through `nvdm_header`,
> +    /// so the NVDM type is what distinguishes the two on the queue,
> and `gmc` holds an RPC
> +    /// header rather than a GMC one when this returns `false`.
> +    pub(crate) fn is_gmc_api(&self) -> bool {
> +        self.nvdm_header.validate(NvdmType::GmcApi)
> +    }
> +
>      /// Returns the number of elements (i.e. memory pages) used by
> this message. pub(crate) fn element_count(&self) -> u32 {
>          self.mctp_payload_size

