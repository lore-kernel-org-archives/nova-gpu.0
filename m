Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010047.outbound.protection.outlook.com [52.101.193.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82D118DB35
	for <nova-gpu@lists.linux.dev>; Thu, 20 Aug 2026 18:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787249843; cv=fail; b=SNYg67JA7ZN2uA3Uo3FOSO+GQDsiTQgCRJFukJ43c3h/E9ywb7aLQoYp+wFGhoWtDLOIf/ub80pF7u9Wz4LyoUziJY3jEcSuL9n3RLVHzP9rSFik66iN9absoYOShxqKYUiIRps2VqJbT1jC0jBkJ9Fu/2xs+cYo1K0f/sCx4W0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787249843; c=relaxed/simple;
	bh=j4dWc+DzOkqKNTC9QmgNI2iOQUjrcwpB3c1rhJO8rSo=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MIjpKW0uv4gSW/ialFRnCDeGQzgDLKoWnYASnWWIzHMH+YbrX4ot4SPURuUu1ES5GEQubEhCk10KDnAZ+HA8VTls/6ElHzk8QM2jXutRNDjMkY8LU0/+mUoOe8ou5BPSsU+73V0HSFb15W63JmvN3KRwdJneeDpjcDmnSOUc6PI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=o+j/vlCU; arc=fail smtp.client-ip=52.101.193.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="o+j/vlCU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JzgkenX7O75NcwS4RjMHYKkenzQmLd6wTlerRcMY8PpEXo0Bgbvt15B/M2L6m3akVhSKBxJ/WaUwuERHmjuRO6qt+c6l99Fzk3mYl2M7ZEkByicWMbqoP9DNDWZSKw7MPFiVnoN+kDpU0xaZxzbiUFmoSYyQqHyjUwBb7NnLzVFXQzJ5E0CKn8/LxcES+HrYl0+dHUxdBt6fkg1+zdmdZIJCUYea6CLMjl5P/PUSF5JQBpck8VLLGSzzqcWiL/PJplTAkacvxXnIpxD5FOHNDCt7xawwg19VT7wKqp5EKGrG8Wq/H6COBggvqudQqbZS25eTDBJLlo/2lD4ZUzjAZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RK9JwXk9AWtk1qtgn5RPFzHsAE2YvQndzR592/2C/LU=;
 b=avXLr7CQSRltMP0s7sYpKfgItAZHcLUkAg7VDXBCgzNQ27skciDbZaJitQVpIN4GZoIAK1oASNeb1FpjnzNcm14vI6XV4hNvbY7GKy88XZHQvE8RopssPcSAVBA2Yspj00EK9GDw/Ng5r2eL0OAS8jQdI5R72kvX1QT3pTm6vlFPA61wt+Y7hXcGvobh29ElClcij7k4jMfL6WEheiToq/2UzYpcGD1pqINxdAfFeJFvV9aKzUIPqMqZ0ln9zDcOH4aKwrWAAQ5WPhZiU/db0Rdr34FBkoesFH/Ldn9cr0symCjLTJ4zk5XkTVFsx7XJH2NuKed1TDLju9jkmcOqxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=umich.edu smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RK9JwXk9AWtk1qtgn5RPFzHsAE2YvQndzR592/2C/LU=;
 b=o+j/vlCUzEhX4rGVgjnd7Q1BAE+lhwRSRXkWnlVSOsFLvLJj+nJuOyyDAP7FY4GKDFkITcFnBiTdTtbDozSDPP+LkN84/m/565a4DG/EmHk4KDCh1d9MjGmcSTkmtVFauL6YcfwHD5h3DzIJ+Dn2jBWGEsAYd+B+TsHVhi++DoFkW6LYYg4noKdFlIXFlt+wLGKhoAERy77lrP2In4NHhCHlJR3cE+/fJWrQsazyi+CuWxGEqnKc3PGchW1loLwRMxeLQr2qqXSio0Eik7F6reuTeQqxbLMLCNVa8MW3lQv1fNVOupzJ5L2rry6N4gNSvcFPd/b4lvCjWta68TnAkA==
Received: from MN2PR22CA0019.namprd22.prod.outlook.com (2603:10b6:208:238::24)
 by MN0PR12MB6365.namprd12.prod.outlook.com (2603:10b6:208:3c2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 18:17:09 +0000
Received: from BN1PEPF00005FFC.namprd05.prod.outlook.com
 (2603:10b6:208:238:cafe::84) by MN2PR22CA0019.outlook.office365.com
 (2603:10b6:208:238::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.10 via Frontend Transport; Thu,
 20 Aug 2026 18:17:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF00005FFC.mail.protection.outlook.com (10.167.243.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Thu, 20 Aug 2026 18:17:09 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 20 Aug
 2026 11:16:41 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Aug
 2026 11:16:40 -0700
Received: from inno-dell (10.127.8.12) by mail.nvidia.com (10.129.68.6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46 via Frontend
 Transport; Thu, 20 Aug 2026 11:16:36 -0700
Date: Thu, 20 Aug 2026 21:16:33 +0300
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
Subject: Re: [PATCH 22/27] gpu: nova-core: gsp: add the GSP_INIT request
 builder
Message-ID: <20260820211633.0cec6f78@inno-dell>
In-Reply-To: <20260819035221.336390-23-jhubbard@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
	<20260819035221.336390-23-jhubbard@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFC:EE_|MN0PR12MB6365:EE_
X-MS-Office365-Filtering-Correlation-Id: 91444f76-c7b7-408a-f7ce-08defee73fbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|82310400026|1800799024|376014|36860700016|13003099007|4143699003|56012099006|10067099003|11063799006|5023799004|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	UsY32Nt16ac10gpIifEKXsXg5WBc9P/AHkPcdpGgJFSScTYn9XHjdBGx8T2Ww2iEf86XN3l8oQHJ2dFmCx5REdbdmzS32OaQrmGUTqao4WUWvf1R1vE3TBl//RtCmCSiidSc1MhAHSKxIGZ8YQlAxSwdL3+2g0n1bEaUfFslnJZgPMMmEq5CyKsUVogWcz7EemyzU+TB67z9AllKP77+GLnpIZg2lR4r/BOspxr0hRDOR3t2ASHAr7jKfTXu0qJZqezWKPIg5ov8SuWaf4NUGIuwq63vrXat62VbqV2sDbpETgXJ1dUe6bYRm7kLHH6Wq3WDbmR6lSAzj/ny2Kcn0/fY1pznxQbT3s7yNjFIdy6/3lVO8AynDgJagdjxOIKuMTpbFJB6eCEuQ2Dk1j5YBdlItJS78jLy+uzjDOPrJGYAUC4pvBvutFioKjawoFptqZbfHwWRL7ctwbvD3YbZK/crUFnLihYTkVfN3VQ+M9DcmhDnwXpEvKxZM+HZWy1fMhdoEJCryy4FtnfNwwpQaD5f9U310gFtTg1Kqv1UpUD5Qg+N/V1v6UBzHTtdK66+OkitikJMatU3F4RSYK4ZgL/XI0wxT6PsN4ytUC0cEJjLOGibsn+9NFblac5Vtd4mxRk3u12DHxCpm6NdgNHcMUKiuVkNxqkq6HtGxFZJef9L7LRFgI7Dde9MTCypEBPe/pt793K4jUcnX2DBNAbtlQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(82310400026)(1800799024)(376014)(36860700016)(13003099007)(4143699003)(56012099006)(10067099003)(11063799006)(5023799004)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8VeqnkBFMEUJNNRP+k0VGHoglIGOqkwcUKj+fS+HxJoVlsZwr93UzDAzAqFulRJ1//7IrNwYeD7i0T0JNm30zqtWcVnfZtMMisOp5PStJUAZJTuexo7qMXAUUdaISgfXCccBWQNifTl0ockGg5R71Ei/zeQUc+0M0HLZnlDxaswItbYOxghw3pRrJmbJLkGugnz9kiMDdyDq2FzwUAzGN+sfnaGPijs1nf8yUIgyizqPFzt5j5PcrhMKVks6UXAs4LwSi/qT0CRpWze1WFsSqYbbN5Li7uIE1NRm/160P2Ol2F/mkJSmevVEIGm1+t/gcYdjHNbEWoAidUn9WEsDx9oFOII6m4TYCNNTBi5g+QARm4K6+4BEyKC204ytD0XM1dqpXN470ZmXROLGkyb777kpNqJoxHNiBdLJd9VtvVJl7bPbISfYzMT81vNP1F2J
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 18:17:09.1531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91444f76-c7b7-408a-f7ce-08defee73fbc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6365

On Tue, 18 Aug 2026 20:52:15 -0700
John Hubbard <jhubbard@nvidia.com> wrote:

> The r000 GSP boot protocol replaces the separate system-info, registry
> and static-info commands with one GSP_INIT request, whose payload is
> an NVKV key-value blob rather than a packed struct.
> 
> Nova-core has the NVKV codec and the GSP_INIT schema, but nothing that
> fills the schema in from a PCI device.
> 
> Add the builder. It encodes the PCI identifiers and config mirror
> range the RPC path already sends, and the registry entries, whose
> names carry the NULL that GSP-RM counts in the encoded length.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

snip

> [`GspSetSystemInfo::init`] on the RPC path.
> +    pub(crate) fn new(
> +        dev: &pci::Device<device::Bound>,
> +        chipset: Chipset,
> +        regkeys: KVVec<RegKey>,
> +    ) -> Self {
> +        let mirror = chipset.pci_config_mirror_range();
> +        let device_id = (u32::from(dev.device_id()) << 16) |
> u32::from(dev.vendor_id().as_raw());
> +        let sub_device_id =
> +            (u32::from(dev.subsystem_device_id()) << 16) |
> u32::from(dev.subsystem_vendor_id()); +
> +        Self {
> +            pci_device_id: device_id.into(),
> +            pci_sub_device_id: sub_device_id.into(),
> +            pci_revision_id: u32::from(dev.revision_id()).into(),
> +            pci_config_mirror_base: mirror.start.into(),
> +            pci_config_mirror_size: (mirror.end -
> mirror.start).into(),
> +            oor_arch: OorArch::host().into(),
> +            bus_device_func: u64::from(dev.dev_id()).into(),

This looks not correct (though the name looks really really confusing):

https://github.com/NVIDIA/open-gpu-kernel-modules/blob/main/src/nvidia/generated/g_gpu_nvoc.h#L439

// DRF macros for GPUBUSINFO::nvDomainBusDeviceFunc
#define NVGPU_BUSDEVICE_DOMAIN     63:32
#define NVGPU_BUSDEVICE_BUS        15:8
#define NVGPU_BUSDEVICE_DEVICE      7:0

static NV_INLINE NvU64 gpuEncodeDomainBusDevice(NvU32 domain, NvU8 bus,
NvU8 device) {
    return DRF_NUM64(GPU, _BUSDEVICE, _DOMAIN, domain) |
           DRF_NUM64(GPU, _BUSDEVICE, _BUS, bus) |
           DRF_NUM64(GPU, _BUSDEVICE, _DEVICE, device);
}

The output should be ((domain << 32) | (bus << 8) | slot) - DBD

While in our code, dev.dev_id() returns from PCI_DEVID(), which is (bus
<< 8) | (slot << 3) | function - BDF.

Z.

> +            regkeys,
> +            vf_info: None,
> +        }
> +    }
>  }
>  
>  // Decode:

