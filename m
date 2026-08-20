Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012063.outbound.protection.outlook.com [52.101.53.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE23413D6E
	for <nova-gpu@lists.linux.dev>; Thu, 20 Aug 2026 10:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787222407; cv=fail; b=gXBWNGiXkt+6+H3sYHW3jbumHtqEEKTGarJliu2D/iS0DV+0pDR8ahN23Wnl1JCJiq21VAjEQi2pT5iZVT54P61ZXDJCOfu1i6bBw1IlajLqkqA0rYEzUUzd0Bl3BZrUEdnEm/X0KzQSFWS68CEhpxugyOhaj1YYWUqI+SXBUSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787222407; c=relaxed/simple;
	bh=/QW7wfeaycozm0t9e8X/Kdf7nyv/e9mT3UL4TGdZJaI=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q0OZUasQVep92CST0PBPssCOcfKti0+f4YWs0PWN+fatSMJsMsBoZgjIwbChBT2kZNdQRTz8DFU+s6o3T4vT+gaeoBbdqBFvkF6M2pFeDHCeT/V7ry7GdtmIOmxyeHPTqXBlYSiGj+RTZhJqGYjfRAscMuxOwU4Apzmj127xFYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Q4sIrIZS; arc=fail smtp.client-ip=52.101.53.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Q4sIrIZS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hji7Pcxf74fJX/+yGgHDovTNuUqeKU1QM55kYuj9TvneFrSU4V6a9Kp4FPUtONrZgpGEWXyb7imZ+YEUpccwfBVPJuhuYbzTCaOOJkmOGnsaNYxHQ1TfHlxH5P2oSxQM1HYv6yAa2EwpQm3qL3oAXjqCk3o23JY1/sBCv+aacjAM5nCEP4u6G26/wWKzrT2oflQtXrC6tBrTjxA9utcJ4N9ulsdvSdkUALEI0iCFExHAe3aH34ttnqoWze1JLNvWbe13pk4WHUOQpzO1UguYsElfOjUDk3j8llzrD5Ea46fqNc2/HwV0y4jhGd4cmIGltg/gO1lGauBF0msRAoE7xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2CxbDRLVUnmvBgScv6qLTNBsvSBPUxE2W6HoCg9jjFM=;
 b=E0ZqMfMDHzdSIQMzy4mt2xxnVS9C6a8Nq+l6wSfhMa95uDJ2v5KjPjB7M7wP4Php5Xlvmnw5hfZszGZEg3pznPFqWMI48bQoA86TJd4P6x6jKTQfWrtJ6TH44W2rS1ATFTf1+GdgcqK1QVmfByF+iZSGJfkBzoLq+1PO7jlL1hL2423Zo6NQW0PzcNzJ7FDtxJt6+rmDf0NVJ50khBX+FkEwLViXKCjzLk0+L+qn8q1IoXcVwDBOJOOoQ1KlgiXG6Rk7Vuh5QlKc4iC4drqo+Z84n+S9/DtHAIwxD9cn0hruNG7j2MY6XRyNfFk82F1qEg5L4uOjEecCNwFNIOPeOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=umich.edu smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CxbDRLVUnmvBgScv6qLTNBsvSBPUxE2W6HoCg9jjFM=;
 b=Q4sIrIZSnPZP5XBoAgL4si7T0Kmd/EQlGtEiZ7SNAN9FxRPhZOY4Mpr1JGCFNb5A82SJmRNKNMMdrdRr5CwZuz0mNVJARwalnIGufF0xoq8EVUDSbWtz1B1o6auT+T0pcYPuJ72rx6Z7IXC8JtS6owlSEK/Nyj8/V5lKvxQTPAexiycmzKT5AfJUEk/6fTr0uVMnclgzjrnVwzmP0DcV77gYhQFenj+vrDPvw0Wiv36PSK3brz1ZeV88MRoyuXF3Z02NuX1+jyo0121idXfpoSkvHZMg6wBeJEqkjeJ8yXld1xp9Gee6fok4lYVy8ENemWj3hk3H252YzhVSQBQQQg==
Received: from CYXPR03CA0010.namprd03.prod.outlook.com (2603:10b6:930:d0::17)
 by CY5PR12MB6478.namprd12.prod.outlook.com (2603:10b6:930:35::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 10:39:59 +0000
Received: from CY4PEPF0000E9D9.namprd05.prod.outlook.com
 (2603:10b6:930:d0:cafe::21) by CYXPR03CA0010.outlook.office365.com
 (2603:10b6:930:d0::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.10 via Frontend Transport; Thu,
 20 Aug 2026 10:39:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000E9D9.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 10:39:59 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 20 Aug
 2026 03:39:41 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Aug
 2026 03:39:40 -0700
Received: from inno-dell (10.127.8.12) by mail.nvidia.com (10.129.68.7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46 via Frontend
 Transport; Thu, 20 Aug 2026 03:39:36 -0700
Date: Thu, 20 Aug 2026 13:39:29 +0300
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
Subject: Re: [PATCH 11/27] gpu: nova-core: regs: add msgq v2 BAR0 register
 declarations
Message-ID: <20260820133929.6f8ec632@inno-dell>
In-Reply-To: <20260819035221.336390-12-jhubbard@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
	<20260819035221.336390-12-jhubbard@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D9:EE_|CY5PR12MB6478:EE_
X-MS-Office365-Filtering-Correlation-Id: d54df5ee-9fe8-4178-066b-08defea7623b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|36860700016|7416014|376014|18002099003|22082099003|56012099006|3023799007|11063799006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	1hMs3KPWsme+r6gaOlw5xpHg9SmBlULnTtOfmJEd+Q03bRCx055F2P0iwHTQZVGS1BlzVoV3DFnH5+68TmLBj4ALJpGKKvRosaq/xPSPE2INN7z7ioIcFoAn5WlkT3CfUB9+AJvOLqi6JKBitMnZbh3s2YfxXW2oWoirWnMbyCIqRfv8TNyu95xPseLZ2es+hn364jJw7NFcEhPSIVXF3J5iWE74Z7JFTvCRfQG9yhdtDvr2aYtrfVpmt5k34gU9eznGY9DAzY//ye8nT6T/6T5i1S3N+J9a7YIHXW0VrlwqsGiNbQMIUHoSyaYQPYxy+KpAMQz5Xs25WVq+GYofhok7Ob3WGNMJeSOTEfHvuTboymwK3oDeeWUuz8ESoy9Am15xbXgax5O2ma5CLiI5yuvG5XrTkCKiOY59yeHswxbQcke8RxVvus/Mz/a8GkEKBYJRCLMQkL0BEjQ/bCgshi4i7lRFUpdqKNB9+xRUuczQ4k1pcDu8LAc92WIoXr0GRQsj33obnqP67NldMSjTROqFBsB1ykfFK5S7CoPSWJbHAXASshVmyB/Frkkj+FWcXPXwzIR+uSWchL6/vjLAe/1JM4JcwGg66UJn8BlnAxiQ/rW+J0Oigj3ryDJ2GE2GbtQuwONxdFfCmNHH9XdhZVe2Hby/0Mj3msJR3UdCU0MqRcPRMp5chHumH/6m7m4E3Rh941307OS2o8e0CehLDg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(7416014)(376014)(18002099003)(22082099003)(56012099006)(3023799007)(11063799006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FXeMcoHpkWJSwexB1+2K0wfhVLH9KOnva6AmsFxSosUZpGzLV0mGCDpLrebgMXYDdalrl0vCMHll477UUCQxI6h7z5yRhItcrxt82IvaDl+C7/K0KvxRglhoq+C3ewaEHIR2+1jHB1JlUI4aKmYJiyUycz3XCnOJ1Xn+DmRSTE4IbCX5hNkL4mY8SoQXLxUJ0z1TnOKCpKkuSYTIVVlF0+h3XhAEDhQj/XNNYCjECk/c3Clabe1Mdz0RucUJDC7uJnbZPZeyZ4fh5C4zJiNUnJm5AaeeLsY67kZleOqUcacWjzvM9+HK+MBpy2acwq6dkCLhthb2T7GPGmvXk1MzJP8l7lYqVj8wL/Rz1FRddr62QofccLk5lxm3gvc8ukN2qOHP+TkPfrmZjRWqGSjbcGiIu7LsN2qkDC0gSj5YBkj/7+YugLUozWICxBR+bY9u
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 10:39:59.2986
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d54df5ee-9fe8-4178-066b-08defea7623b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6478

On Tue, 18 Aug 2026 20:52:04 -0700
John Hubbard <jhubbard@nvidia.com> wrote:

Looking good to me.

Reviewed-by: Zhi Wang <zhiw@nvidia.com>

Z.

> Msgq v2 moves the four ring pointers out of the in-memory headers and
> into BAR0. NV_PGSP_QUEUE_HEAD already exists as the v0 doorbell, so
> add NV_PGSP_QUEUE_TAIL, NV_PGSP_MSGQ_HEAD, and NV_PGSP_MSGQ_TAIL at
> the queue-0 offsets.
> 
> Nova only uses queue 0, so the registers are scalars rather than
> 8-element arrays. A comment records the full hardware layout for
> future multi-queue work.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/regs.rs | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/nova-core/gsp/regs.rs
> b/drivers/gpu/nova-core/gsp/regs.rs index 9a48aa87e7fb..d2e40ed13123
> 100644 --- a/drivers/gpu/nova-core/gsp/regs.rs
> +++ b/drivers/gpu/nova-core/gsp/regs.rs
> @@ -5,6 +5,18 @@
>  use crate::regs::NV_PBUS_SW_SCRATCH;
>  
>  // PGSP
> +//
> +// The msgq v2 wire protocol replaces the in-memory ring pointers
> with four +// BAR0 registers per queue:
> +//
> +//     NV_PGSP_QUEUE_HEAD[i] @ 0x00110c00 + i*8  (CPU TX write,
> doorbell) +//     NV_PGSP_QUEUE_TAIL[i] @ 0x00110c04 + i*8  (GSP TX
> read) +//     NV_PGSP_MSGQ_HEAD[i]  @ 0x00110c80 + i*8  (GSP RX write)
> +//     NV_PGSP_MSGQ_TAIL[i]  @ 0x00110c84 + i*8  (CPU RX read)
> +//
> +// Nova only uses queue 0, so the four registers are declared as
> single +// scalars at the i=0 offsets. NV_PGSP_QUEUE_HEAD is also
> used as the v0 +// doorbell, which is why it predates the others.
>  
>  register! {
>      pub(super) NV_PGSP_QUEUE_HEAD(u32) @ 0x00110c00 {
> @@ -12,6 +24,24 @@
>      }
>  }
>  
> +register! {
> +    pub(super) NV_PGSP_QUEUE_TAIL(u32) @ 0x00110c04 {
> +        31:0    address;
> +    }
> +}
> +
> +register! {
> +    pub(super) NV_PGSP_MSGQ_HEAD(u32) @ 0x00110c80 {
> +        31:0    address;
> +    }
> +}
> +
> +register! {
> +    pub(super) NV_PGSP_MSGQ_TAIL(u32) @ 0x00110c84 {
> +        31:0    address;
> +    }
> +}
> +
>  // PBUS
>  
>  register! {

