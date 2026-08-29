Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011040.outbound.protection.outlook.com [40.93.194.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9E73AA9E2
	for <nova-gpu@lists.linux.dev>; Sat, 29 Aug 2026 01:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787966775; cv=fail; b=a0kvhNu7pqMj7v4nKTTbR7WgrrTVhS+AF0nT9cj01vUlcYd90gcG+0osPR6gGaLnJJNeyGstOvW9xoCCb3BeE4BTdKGFG+/N+wx01wD9YBy90Ne0oGPakRgmUv0WLRrBEElzV/dOEHk6825aALmv/aQGtO8LPA9qeRAGa+7WzFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787966775; c=relaxed/simple;
	bh=cCZTEiyBv0LCPA1YfNICEirtzv0aWdA74BS195wQ3ZY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=adGeTK606+ihVLhh20VU71dEX//s2xIjCj7PEJURemQEgEQT5nfo/NDBDXmrL81KDb1l+logXG8dSf1iWE5Q9kcwo/btBvTHJL2sdxQgncHq9NJSEexcV9XQ+/UeR/NWdFGMWrzBi04m9c10xQJNrS7F8XAaX0wATNc60vyK3P4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=H75yJpaa; arc=fail smtp.client-ip=40.93.194.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="H75yJpaa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vXnf9NcnOWJ3LmG2kWNAFXsCixqAjC/tMIMMq5Rj4716M6v69HinilnZbSC0p3jQgumCgkBRkb9JkXbZkKaxcOsmwC0F91HeFIz2Pu6jFBzBWS5YDejnvKWFO53byZPY5lP/puMXa1vhq4G6V5Izel00fAGxxYtsOqHSbAAGWqdkyvx20jlIAUeNNaT+QRmnUao87+X0uuHHyAQhC2sd/Ph4EiELM0rvgEQwkn5vN/L/WIPtpz9Mv5rEuUDzsXAeYu98LwZ5HQcUfPagvjKlDRphx1/eI2Fobta1lffYTkLAMQAXC/+oM9QeVLUlo/3GMbxIPcD1fQp7nYDUPaw9SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cTpJlwp4SYJE+nh8s8M2lN1pqZTudSwRZVBNSR1nm/I=;
 b=qXZB00w81ekwlry5P8u1MiDJeMLSmQYgS/sBIMswRfrfeMme0b01lDRG94uUy5RyjxrbhDVj2LO/y9gSudSp3csFGyRFMS4hjQIW5YiE8iinKHW5wWUneo+W5JpydwuBsgz7cBdwLMqPfPBAB1ekn0k5ThAyar0N31xzt9Uh948cHg3IDxc/wYsOUCgLTFqBjt3oRDjB2hTGiZp5Npvsq5sGLxvIOjy3Wu72nxyxmu+nhubtcmKvrfoHT/vPqjqdol40ktuwee70AkayhB16d52PvK5u4q2Ai2+Tq+CxXX5MXX6JWULlMRR42Xa7+sfkbfdHcouW21FEqJFR03e2LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cTpJlwp4SYJE+nh8s8M2lN1pqZTudSwRZVBNSR1nm/I=;
 b=H75yJpaaqHiPWUkMKktDT3GbaiZck0UUgTHhzNhd3xlB6npp4nkKwlKsTxwEn/ukMdZvXnhoSKprezIwk0chtbuMBxJatGV4S6OSJSWr6hAnX+pd4uNq7ltB+NKSCF9QYodK60ym7MWeXoACVULJofHXKinWXWJvyKpDTfUxk9OeaNzzcbzMOye1Wg1XJ+tdtAHCRSLGTNvI27yj4EmYSi9Xp/vMvXTmByixVDefUSGBCY5asEfzFPSMNNzsuWT+PXUafT2ILyNHD/b/OW0/SIr5yhgEepksFtjby9Stk/reee/znDnaHPu2WsVzE8ZGEABcEsPn6e31ox028lROEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN0PR12MB6125.namprd12.prod.outlook.com (2603:10b6:208:3c7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Sat, 29 Aug
 2026 01:26:02 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0360.008; Sat, 29 Aug 2026
 01:26:02 +0000
Message-ID: <1e7ac24e-5a14-4324-8e3b-a84f96af5ec2@nvidia.com>
Date: Fri, 28 Aug 2026 18:25:59 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/15] nova-core: GPU interrupt support and GSP event
 delivery
To: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, nova-gpu@lists.linux.dev,
 LKML <linux-kernel@vger.kernel.org>
References: <20260829012243.496697-1-jhubbard@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260829012243.496697-1-jhubbard@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0072.namprd05.prod.outlook.com
 (2603:10b6:a03:332::17) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN0PR12MB6125:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d4dc0cb-5e59-453a-6913-08df056c7ce8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|6133799003|3023799007|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	wCyvWUggAQq1n9gML4qPnNCSj246E8J5BescKF8qtv/5erszCOYroHoiRGvQ1rLGascKfFk5PQMU+JnlWf734sqiAjdYInQzdBxha7z/gYA1fUFdGixDtkzufWexj3/Qs4uZmjR/kXso75bq+lBoyA5eDUk/0wZ1y/+MDt8qXPw+Ty30vAyoGyDkyALY00QIjzPoOKWvQKyUw0KOhuXtEZpVvsi4QgoRBZbDUYbmOlfFeA6GwdqXGAC1GPKW677QZ82K3ONuzgHr68hvlVyW5zRrbEgj4j5DFxE7U8ltRLIaJmzVDCnIIGfMAHvPXSxtqY0pG8Qxy6OkvhBPhyslrt/ac3mwUbX0wQUYaq2HKuRxChj0XzSgYalOWiUmxgIuoWHbI5Q19skYycItLJu+UDU7xx1fCGXpy326MVAQ5kd9GII3ejwd596OfiWtlk8EgQxR6R35eVUDSJjfhIi4h/OqXPbPF2VQLiFwtig03JaCsBvNGlbxjypj3Ksq3Q420AP4/0FzeHucvlibjFwvTRbBZX0SEOeGlQBgzbmknY5LNXGSwm9kcK7XEPdWUg85dwfJGEesTh2YpDLUZ0LZlrPVeGREVeE5oOO1Q7ezeYu1HVwW+KBxHfBZgSv+NYvCaH9oQmN86BdBhkVWKCSFGSElWwYetATyJ6xdNoFkQP0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWFDdmF0UTJmOEUxSXExa3NDdUFRY2JBa0IrWXVoelJFVEh5WWZsNzZKUnNr?=
 =?utf-8?B?ak1lN29xNjI1NzBYbEZ2MG5wNVNXTDNsRzhpdGpmQnA3OStoUngzYVRIREhE?=
 =?utf-8?B?aGtuaDNvOTc2V1FMUFo2YXEwTjZrWFM5MHRZdzBIczlJYW1mYjk1RGpyeHBS?=
 =?utf-8?B?TlpQLzhWcmdhbVQxMFhPbHhzbXB1TFU1M2lMOFF1T2VVcTl4N2draHVNM3c5?=
 =?utf-8?B?N05wTDlidE0vR3dycU1PYTRhK3hTL0sxWTNBYmZoTzZHY2tFenVGM0V1dTNO?=
 =?utf-8?B?cm1kOGltSmM2b1FmVGp0QVBHWm1qVlI0RjJtYktMdUVQdXo3V01sbEdOMTZz?=
 =?utf-8?B?SFFINGx2QlRHV1lrNVFFUlNSNS93b21DRk55d3hyaHUzNnRkdVlQT1FSNXNV?=
 =?utf-8?B?bXd0RGEzdVFubFpIZlFRTGt6TnJrMkdyVllySHczSzF6OE5FL2MyYmZCKzBE?=
 =?utf-8?B?OUxKZ2IxRlhURXRmbE1aTHRNK1ljNXFiZFR3NUY5Tjk3K09VN1NVOGRnd3hR?=
 =?utf-8?B?MFNjNG9Tcy9EbC9IMC80ZzVZUTZhQ3B5Yk90czNrQmdkVnUwbHptVVQxb0c5?=
 =?utf-8?B?QThFdjdCNlAvdUZ6dnROcmJwRGQvMnNMQzdyWkNXOTVNWkRHbGV3b0Q2U1RH?=
 =?utf-8?B?ODZ1MXJmUFdCenZ3NWM1eTViMmgwa0lBSUdmNDBtWnJRUXloTTlRWXRySnRs?=
 =?utf-8?B?M0psYkt1RW1NSjk4WElwbEJSeW90bUVxbVd6dHVGWmsvRUk5OThMaEF1UmNu?=
 =?utf-8?B?d09MdTAvVnhKYW1DdnprNU1EYy8zd0FuRXhVUGJCaGtxZUg2VmZPNEpqYk9n?=
 =?utf-8?B?am9xdVN3RlR3anVQYTlPS1RuZ3llMTRGaEJBQytUQzNEWm43SFllSFFwQjRQ?=
 =?utf-8?B?dmdXeU9lenFkamtVTW15U0ZoakNCUjB1Sm5qT09ueWdmZDIzQlVONVgyNWtz?=
 =?utf-8?B?Z2FhRHJFQnNBTGZZSU9MS2dkbDFUNk5QOW1PeXZ0Mlo4NFJwSWY3eDVGcklq?=
 =?utf-8?B?dXhUbER4WFE2ZzdaUXczNXhKeURsSjhjTFNYbDVQUmdhUGUwMGp4WFdhditM?=
 =?utf-8?B?c3FmQnRnZlZ4QWpYQW8rMXRyQ05sUE9Id2ZudVhNUklmNU1qRk1ybmFvVUtQ?=
 =?utf-8?B?QjJrUEJET2wwcGtVWmpkZFRCOVY1V1VNYTJXTE8ySUY4cFpvbTdkTklZRTRE?=
 =?utf-8?B?YlRiRnR3SDN0ZWdxMFhHc0xDeXhvZVRPOVJ1RnlFTGthZzgwMEdGUnhMaCs3?=
 =?utf-8?B?VHg0RXRJb3dFc3pOY0l5NXdNeUJ0dDZMSkl5aEY2R01Wb0RVemZUM1NBcllY?=
 =?utf-8?B?UjhCYXlPSXJEcW1nZlJ0L2xBWDRMVndlWGFSVzBQRVR5WHBET2lTL0VpTXJv?=
 =?utf-8?B?cW9qanpoQ2JnY2dOalM0YXRvNTNhdkhGNTZ4WTRpakNZS2xNZGEzR21iczNR?=
 =?utf-8?B?c0tJckhlWjRNM1NqbTFrVFI2VEh6YjhDTDdwcjNqVStuMkdqRER4b3ZEOHJj?=
 =?utf-8?B?Y29BYzVmd2VLZ3YraC83aWV4ZGlkMlBFNVhLMUJvNlpEM3d5Yk5Lb2xhQWN0?=
 =?utf-8?B?bGJsOUpPWDZMNHBjb2JUN0UwbnB4b0hpb1g5dHZjeUNnSjQvUGJlKzQ4cHky?=
 =?utf-8?B?SUE0Rk5wQkwrNEViM0E5cUFrVG8vcmVpYm1FbnlDVjhjZU9McE55di9QQkN2?=
 =?utf-8?B?YUxKWWtkV09BOUJOQzNmNXdGc2s4WHpad093NXlmSTBRQTgwYWp5RDhteGJz?=
 =?utf-8?B?TDlHWmEzbHBFVm4rN2c4Nlg4cWw3RlpYelVKbVdVM0tXSk1WeWtBT01DRDlr?=
 =?utf-8?B?VENCR0syZ091M0JEZ2h1M3JZbWV6aUY5eTV6TFdQeXBZb0dRajhma3p0V1FI?=
 =?utf-8?B?bEhiaEVRcDdDTG82UmJsZ3JBUXgvMk5pSVVPR0FJS0htVHUrN2lxd1F1RUY2?=
 =?utf-8?B?ZGlsVDdNdkJEU3BNQVNWakdiNi9CUzdjNkFrVXYwUXBOM2N5NHFJRE9YUVNT?=
 =?utf-8?B?dmNncHF0YWhrRkozTXZZbTFKM2tUeHoyWXRvZ1hJM24yYjFFUENjVE5ET2s4?=
 =?utf-8?B?bmV0ZEdxTWJ1aEZBcUs5WVpNQmVGbWhJcm8wbkZkWitjYnQ2UHBQS1B1d25X?=
 =?utf-8?B?bnNFMXd6MFllejdqTnFzTHNYTHFrN1Bqb1ozYXFBNkRNRXdsOC9TYnBXVDNy?=
 =?utf-8?B?ek1LRm5UVFA5RXM0OExhdWFNeHo4T2UvSTBwK0hDS05NQ01LYWVETEIvajlD?=
 =?utf-8?B?Z25TTXBvU0h0aG5hcVRicHJGNWg2ZDZaeEdoQVgvMGY4cTNLQzk0YnFWVHBY?=
 =?utf-8?B?TmxmdkhVblRHRGd4TWFTVHRER0RyOTU0UFppTnZXTjN0enBwUnpZQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d4dc0cb-5e59-453a-6913-08df056c7ce8
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 01:26:02.1697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Emfc3O15E52XR/GMRQwvcW17wUf6YXNY3mgrX8O8wPhqEtWo7rn335oEhbWeAQhMMEp6yOAf9m8/IUei4nxrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6125

On 8/28/26 6:22 PM, John Hubbard wrote:
> I'm posting a v2 because there have been some significant changes, as a
> result of the v1 review, plus Danilo's new IRQ commits that I've rebased
> onto.

There was a failure in git-send-email part way through. I'll attempt to
resend, once I figure out what went wrong.

Only the cover letter and the first 4 patches got sent.

thanks,
-- 
John Hubbard
> 
> This series adds support for GIN, the GPU Interrupt and Notification
> unit, which is the GPU's interrupt controller, so that GSP events reach
> the driver as interrupts instead of only when the driver polls.
> 
> The design uses a threaded IRQ handler. The top half touches only
> GPU registers, while the threaded bottom half drains the message queue.
> 
> Fine-grained locking is left for a follow-up patchset, I'm working on
> that next. For now, there is just a big ugly lock around anything that
> even gets close to the GSP message queue. :)
> 
> This is based on drm-rust-next, plus the six commits of Danilo
> Krummrich's PCI interrupt-vector series [1], which I've cherry-picked
> from mainline for now.
> 
> There is a git branch with the patches as applied to drm-rust-next:
> 
>     https://github.com/johnhubbard/linux/tree/nova-core-gin-interrupt-tree-v2/
> 
> Changes in v2:
> 
> * Rebased onto current drm-rust-next. The PCI interrupt-vector rework
>   that v1 patches 2 and 3 proposed is in mainline now as Danilo's series
>   [1], so both are dropped. This series carries those six commits as
>   prerequisites until drm-rust-next picks them up.
> 
> * nova-core uses the merged API: the driver's device data owns the
>   vector allocation under an explicit lifetime rather than through
>   devres, and each handler takes an IrqRequest for its own subtree's
>   vector.
> 
> * Dropped "allocate PCI MSI vector during probe" (v1 patch 4). What it
>   added is replaced by patch 6, and its commit message justified MSI
>   with a VFIO claim that does not hold. nova-core still allocates MSI-X
>   or MSI, and no longer falls back to INTx. (Danilo)
> 
> * Dropped the type-invariant documentation and the SAFETY rewrites from
>   the wait_for_completion_timeout() patch, leaving only the new method
>   itself. (Alexandre)
> 
> * New: declare pci::IrqType and IrqTypes with impl_flags, so a call site
>   reads IrqType::MsiX | IrqType::Msi. (Gary)
> 
> * New: the GIN vector and subtree newtypes. A vector, a leaf index, a
>   set of vectors within one leaf, one subtree, a set of subtrees, and a
>   leaf count are separate types now, so a leaf mask cannot be passed
>   where a TOP bit belongs. The HAL returns a LeafCount rather than a
>   usize. GSP_LEAF and GSP_BIT are gone, along with the
>   LeafIndex::new::<GSP_LEAF>() calls. (Danilo)
> 
> * Merged the tree API patch into the vector allocation patch, and moved
>   both after the HAL. Tree owns the BAR mapping, so no tree method takes
>   a bar argument. The Leaf<Idle>/Leaf<Pending> type state gives way to a
>   LeafPending newtype that only Tree::read_pending hands out, and enable
>   and disable are Tree methods. (Danilo)
> 
> * Added LeafEnableGuard and TopEnableGuard. The self-test's teardown
>   guard and GspIrq's open-coded destructor are both gone, and probe no
>   longer needs a separate interrupt-enable step. (Danilo)
> 
> * Moved the GIN and MSI EOI register definitions to irq/regs.rs.
>   (Danilo)
> 
> * 13 KUnit tests rather than 14. The tree tests now cover the newtypes,
>   and testing those needs no BAR mapping. One test went away because a
>   leaf count derives its subtree set by construction.
> 
> Tested on Turing, Ampere, Blackwell GPUs.
> 
> One known gap: driver_read_area still reads the GSP producer pointer
> with no acquire barrier. Gary Guo's barrier series puts dma_mb(Read) at
> exactly that point [2], so let's just wait for his fix to land.
> 
> [1] https://lore.kernel.org/all/20260813165234.620555-1-dakr@kernel.org/
> [2] https://lore.kernel.org/all/20260609-rust-barrier-v2-4-30fcc48e1cd0@garyguo.net/
> 
> 
> Joel Fernandes (2):
>   rust: sync: completion: add wait_for_completion_timeout()
>   gpu: nova-core: add the GIN interrupt tree and allocate its vectors
> 
> John Hubbard (13):
>   rust: pci: declare IrqType and IrqTypes with impl_flags
>   gpu: nova-core: add the GIN CPU interrupt tree and MSI EOI registers
>   gpu: nova-core: add the GIN vector and subtree newtypes
>   gpu: nova-core: add the per-architecture GIN CPU interrupt HAL
>   gpu: nova-core: add an interrupt delivery self-test
>   gpu: nova-core: dispatch GSP events instead of discarding them
>   gpu: nova-core: match GSP RPC replies by sequence, not just function
>   gpu: nova-core: recover the GSP receive path from corrupt framing
>   gpu: nova-core: bound a GSP wait by a single deadline
>   gpu: nova-core: drive GSP events with the SWGEN0 interrupt
>   gpu: nova-core: retrigger the GSP falcon and clear every latched cause
>   gpu: nova-core: add KUnit tests for the interrupt tree and HALs
>   gpu: nova-core: document the GIN interrupt controller and GSP events
> 
>  Documentation/gpu/nova/core/interrupts.rst  | 686 ++++++++++++++++++++
>  Documentation/gpu/nova/index.rst            |   1 +
>  drivers/gpu/nova-core/Kconfig               |  15 +
>  drivers/gpu/nova-core/driver.rs             |  55 +-
>  drivers/gpu/nova-core/falcon/gsp.rs         |  71 +-
>  drivers/gpu/nova-core/falcon/hal.rs         |  32 +
>  drivers/gpu/nova-core/gpu.rs                |  28 +-
>  drivers/gpu/nova-core/gsp.rs                |  17 +-
>  drivers/gpu/nova-core/gsp/cmdq.rs           | 286 ++++++--
>  drivers/gpu/nova-core/gsp/commands.rs       |   8 +-
>  drivers/gpu/nova-core/gsp/fw.rs             |  13 +-
>  drivers/gpu/nova-core/gsp/sequencer.rs      |   8 +-
>  drivers/gpu/nova-core/irq.rs                | 105 +++
>  drivers/gpu/nova-core/irq/doorbell_test.rs  | 298 +++++++++
>  drivers/gpu/nova-core/irq/gsp.rs            | 232 +++++++
>  drivers/gpu/nova-core/irq/hal.rs            | 192 ++++++
>  drivers/gpu/nova-core/irq/hal/gh100.rs      |  31 +
>  drivers/gpu/nova-core/irq/hal/tu102.rs      |  30 +
>  drivers/gpu/nova-core/irq/interrupt_tree.rs | 615 ++++++++++++++++++
>  drivers/gpu/nova-core/irq/regs.rs           |  71 ++
>  drivers/gpu/nova-core/nova_core.rs          |   1 +
>  drivers/gpu/nova-core/regs.rs               |  24 +
>  rust/kernel/pci/irq.rs                      |  68 +-
>  rust/kernel/sync/completion.rs              |  23 +-
>  24 files changed, 2767 insertions(+), 143 deletions(-)
>  create mode 100644 Documentation/gpu/nova/core/interrupts.rst
>  create mode 100644 drivers/gpu/nova-core/irq.rs
>  create mode 100644 drivers/gpu/nova-core/irq/doorbell_test.rs
>  create mode 100644 drivers/gpu/nova-core/irq/gsp.rs
>  create mode 100644 drivers/gpu/nova-core/irq/hal.rs
>  create mode 100644 drivers/gpu/nova-core/irq/hal/gh100.rs
>  create mode 100644 drivers/gpu/nova-core/irq/hal/tu102.rs
>  create mode 100644 drivers/gpu/nova-core/irq/interrupt_tree.rs
>  create mode 100644 drivers/gpu/nova-core/irq/regs.rs
> 


