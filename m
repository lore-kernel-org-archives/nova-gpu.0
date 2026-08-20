Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012020.outbound.protection.outlook.com [52.101.53.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E142A41A55B
	for <nova-gpu@lists.linux.dev>; Thu, 20 Aug 2026 12:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787227288; cv=fail; b=itmMXC4n0NbvG1kNAlF1PMUxuadW1wgAIXO+fdHZkUXCpH5dZ/qonAiqOfySLQF9vJKGs1oYdP85+hNGq9ZbbcfclgXtgkRHLCmPXplGSJmIAny0x2DI8FtM1pHj1mBC+qgQYpOJoDDGELB9VvxbMWbgjC9iuFhVmYhFMfpbMSM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787227288; c=relaxed/simple;
	bh=19Qgh716iBARFHJZKi0xa7udhTvak7pnwD0/7hIMR24=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j5UnIrWXuQaZ8vPr8m7pAAA9uY7oozT6/gFTob30sF+X7l3xcmY5vdMmXjQ6fh/8QlbSXfOG58pErHmQuLI0AL7WS19MYhG2XR5CmJjKdn9zhzvtp5TVLO5VBrdD+n6PDAtOf0zSxmMmDC4t4Q192yQEyZsxkyAZ824XiSUQ78M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ExMsTnEO; arc=fail smtp.client-ip=52.101.53.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ExMsTnEO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zJ1o5FYkaluccwRGZ8KHQGL7W/HegcTpxaeWOn3aRfT06+n8vQY/BOHhtLT5ZvQw1S+Y5JGVdD540noqYsQuihuTZlYw1a7JSFRhp4FZCsKbqTiEz26htgFw0BODlrX1zOnk5Kb7qRr6XlFsBVUX5lgYu6sJWQSwCytAKKj4ReX3VD+qPffYCqQJ9e0fPLioS2k1oP7Hg3GSenF6CCN1rJ4flOHwiv0Beya45ox3rCwZIEbXBnAqEuGPsCGB5LcoqqYciPtpqCh5fL7HNfjzSiO5HCkTmY2rdkaxjvmON3dW543GWvCRiBuzkx463F+eHwCZSP67RW1Hsfidhxq+9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ypebUBmPOHfSjXHgrQQ+DN/Agy+7raJKjtqB7dioPCg=;
 b=BGVorxDEY+SObjfrQZJnG2/JY2zTpmwKweAC7RycK3OfZsfk85luFRPHpbBVMZNA3jY0d+m1azhUhAgW5709BhJrMBX9tiZU+PdhCj9R+cL2qnQsG5O8etHS7yDjyTnk66LPQz/g6dykrkri+XnXulx6vfGPRpBX0KDOBpnXAJc963+XzgDPHOWPdzreXQXUgcMDn2FO+HkKSS65ctnbvJwwADBP4rVeSkB7HOO1PuktvRT7LEOlwuYnsSoRbvwOBxdnbBMaorkNI7pX6QG8E1sSq+n36+hIq7/ps6tSoFdqbdnYP23Crnq90pAy4f7Ay4t70jPls33djNtUXFK7NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=umich.edu smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ypebUBmPOHfSjXHgrQQ+DN/Agy+7raJKjtqB7dioPCg=;
 b=ExMsTnEOutELXhd0sdgb0byZOhepuxJjRiJzCNGDXbmBOTa71DQyYj8Q7j/xelcUL4V0OELJFJ0Sjm+bho8UBZYxRkoAAFOePJ6JUpfBFOTzseXu5M+NH3TQphaRXPXeq0VE1Cx0/8oPDqcd6Lp2Gz/lcxuIpWgMn6rXRnZ+3MsqWYcpIpUodCRkvpc/hXcx/BNYrtK7OSqBJ0jT9nXPKZFzEJIvLtXzW4X9AzWjhiTjA3KE4FV3o2u2KoI5jWGVFvtV1U7Fw11qhwsVn5r1mjZnv1WdZz3GoXHSRXeZ0zemKcQpwz/yp9f7ZgTiT1vawJ3BWiQPhdnHXlbCs6THwQ==
Received: from IA1P220CA0009.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:461::6)
 by PH7PR12MB7137.namprd12.prod.outlook.com (2603:10b6:510:1ed::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 12:01:17 +0000
Received: from BL6PEPF00020E5F.namprd04.prod.outlook.com
 (2603:10b6:208:461:cafe::57) by IA1P220CA0009.outlook.office365.com
 (2603:10b6:208:461::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.10 via Frontend Transport; Thu,
 20 Aug 2026 12:01:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF00020E5F.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 12:01:16 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 20 Aug
 2026 05:00:57 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Aug
 2026 05:00:56 -0700
Received: from inno-dell (10.127.8.12) by mail.nvidia.com (10.129.68.7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46 via Frontend
 Transport; Thu, 20 Aug 2026 05:00:51 -0700
Date: Thu, 20 Aug 2026 15:00:49 +0300
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
Subject: Re: [PATCH 16/27] gpu: nova-core: add GMC transport receive path
Message-ID: <20260820150049.5aabb1a5@inno-dell>
In-Reply-To: <20260819035221.336390-17-jhubbard@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
	<20260819035221.336390-17-jhubbard@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E5F:EE_|PH7PR12MB7137:EE_
X-MS-Office365-Filtering-Correlation-Id: f3af0248-a3f0-4a12-c0db-08defeb2bd33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|23010399003|7416014|82310400026|376014|56012099006|10067099003|3023799007|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	Z6X3H4lF2V5B+pmMmhz79Uc0Qriok0YghLstuRtB0IHOZVJN3WA2YPQ0gaQCbVfS5lo41er1BT6TzYa+54ZK8Mk9Agpca3QwqjO97TJPs9el7T6jyn7HjVeo0qjftV9DnKc1j/2hcyBFe+2vgNPqa2m44o5czG3xGgZMlcNnd1pRnon40sLRhf8bo4szBqTJgpdqyNMy9KDdSRCEx/hRMCK7zMxhpyLt6b+HUdJgNxGd9VUoM8dKvfc/PP3zh7Ws4URDUiGIyQk0s3/IXum3G/vwWtz2oV9EXE6nFdcZzrboNCJyrOw5IcMe5qXDi7f/rRajJ6meSDdDlDhzZEG7VYzKURmTYLkGLyl99b8yDEgRJ/hIV7I212tcvKwS9xClf6SqkwXfkfB/GWScDOcDofgvxGu8aAEh47lG7ddUus224TMKwqrdlVLfbugIeVi5O0sQQ68eEYRhj+mHwizgilCvaBwf4w1k67UhisK8SfbbPhDDhGS974OrIep7FbGDKuqbeZ74x2ZD7WMSKs1j5LZ+G4+RHfJFD85GjlY/1kJ5eJoYW5jdXlwGrU+CqnZvqXN6M0w4aYFKFK9h5oMPWuOucLORCM1fjHsknjH6rVXnUpqpSaXdOLZYee+Q0z5kE1Ex/sYjfj/Q34MP2Z9qPuwlvBZk71UL4huhSmElLkR8R41GOFUYFKpVFZjl6/pSNTBkm9LtNOuVU3nSbun1zA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(7416014)(82310400026)(376014)(56012099006)(10067099003)(3023799007)(18002099003)(22082099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cTNzI6fDVQQXERbZA7fsUKjMkdsCmbLQEcxXsyt7RevlNKMTwZR0ByW3eZmu4o5hyRTPpLoEbxcPHdYDyQknifVWoBrYa9LNpSEobVWTTrpk9cf1jAPw9AuFbptW8nAFff9ftn4Q/hVsSgRMLXPyu5Y/y+YxH57RIwNVmaQwJ1E2IwdHVM1gTYKEUGgA2vKXAsrgAQcacqfCy2J2iDrlqa3/AHSmJ+cCw05pOkqyrjWGtbmrvIp45RJVpxFeaCzQcAaDx0eDSdaE9Mlak76Wl53MIWUHaYtBMQ2IUPLhuYS7KVWJLLMA9H6GRZ/+lyC4zZ1eRZWRCX7A0NlvOZjBLUQ3l6Zs7ptfSS+LQiLkX5nL0+wEamaPe9dOviEpNpv83OvXM1FDtqKkr/Kag+fGnL4rZQSCuxW4dSnaBYpLFQK5k8hik19SHWfeCfcM6MYL
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 12:01:16.3148
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3af0248-a3f0-4a12-c0db-08defeb2bd33
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E5F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7137

On Tue, 18 Aug 2026 20:52:09 -0700
John Hubbard <jhubbard@nvidia.com> wrote:

> GSP-RM posts GMC and RPC messages on the same message queue. Both use
> the same MCTP and NVDM transport headers, but RPC messages continue
> with rpc_message_header_v and GMC messages continue with GmcApiHeader.
> Existing RPC receive code cannot parse the GMC layout.
> 

snip


> +    fn wait_for_gmc_msg(&self, timeout: Delta) ->
> Result<GmcMessage<'_>> {
> +        if self.poisoned.get() {
> +            return Err(EIO);
> +        }
> +
> +        let (slice_1, slice_2) = read_poll_timeout(
> +            || Ok(self.gsp_mem.driver_read_area()),
> +            |driver_area| !driver_area.0.is_empty(),
> +            Delta::from_millis(1),
> +            timeout,
> +        )
> +        .map(|(slice_1, slice_2)| (slice_1.as_flattened(),
> slice_2.as_flattened()))?; +
> +        let Some((header, slice_1)) =
> GspGmcMsgElement::from_bytes_prefix(slice_1) else {
> +            self.poisoned.set(true);
> +            return Err(EIO);
> +        };
> +
> +        // Checked before any length field is read, since a bad
> magic leaves them untrusted.
> +        if !header.has_valid_magic() {
> +            dev_err!(&self.dev, "GSP GMC: receive: bad MCTP
> magic\n");
> +            self.poisoned.set(true);
> +            return Err(EIO);
> +        }
> +

IMO, should we also check the MCTP version here?

> +        let payload_length = header.payload_length();
> +
> +        // Check that the driver read area is large enough for the
> message.
> +        if slice_1.len() + slice_2.len() < payload_length {
> +            self.poisoned.set(true);
> +            return Err(EIO);
> +        }
> +

Do we need more checks here? Here we only checked the nvdm payload
size, while in PATCH 17, the queue cursor is advanced by mctp payload
size. It would be better we can confirm the frame correctness here in
PATCH 16, e.g. check the mctp payload size with various constraints.
(size > min size, size < QUEUE MAX SIZE, size < available space,
etc...r000 firmware does check these) 


> +        // Cut the message slices down to the actual length of the
> message.
> +        let (slice_1, slice_2) = if slice_1.len() > payload_length {
> +            // PANIC: we checked above that `slice_1` is at least as
> long as `payload_length`.
> +            (slice_1.split_at(payload_length).0, &slice_2[0..0])
> +        } else {
> +            (
> +                slice_1,
> +                // PANIC: we checked above that `slice_1.len() +
> slice_2.len()` is at least as
> +                // large as `payload_length`.
> +                slice_2.split_at(payload_length - slice_1.len()).0,
> +            )
> +        };
> +
> +        Ok(GmcMessage {
> +            header,
> +            contents: (slice_1, slice_2),
> +        })
> +    }
>  }
> diff --git a/drivers/gpu/nova-core/gsp/fw.rs
> b/drivers/gpu/nova-core/gsp/fw.rs index 56f255a3d49c..9e6b5ec6aadb
> 100644 --- a/drivers/gpu/nova-core/gsp/fw.rs
> +++ b/drivers/gpu/nova-core/gsp/fw.rs
> @@ -1055,11 +1055,21 @@ pub(crate) fn init(
>          })
>      }
>  
> +    /// Returns the length of the response payload (data after the
> [`GmcApiHeader`]).
> +    pub(crate) fn payload_length(&self) -> usize {
> +
> num::u32_as_usize(self.nvdm_payload_size).saturating_sub(size_of::<GmcApiHeader>())
> +    }
> +
>      /// Returns the total length of the message, transport and GMC
> headers included. pub(crate) fn length(&self) -> usize {
>          num::u32_as_usize(self.mctp_payload_size)
>      }
>  
> +    /// Returns `true` if the MCTP magic field contains the expected
> value.
> +    pub(crate) fn has_valid_magic(&self) -> bool {
> +        self.mctp_magic == MCTP_MAGIC
> +    }
> +
>      /// Returns the number of elements (i.e. memory pages) used by
> this message. pub(crate) fn element_count(&self) -> u32 {
>          self.mctp_payload_size

