Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010031.outbound.protection.outlook.com [52.101.56.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BCE3CB2D2
	for <nova-gpu@lists.linux.dev>; Sun,  6 Sep 2026 23:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788736221; cv=fail; b=hGeoGqrf9qFDYhH9BmD6JsbiSFZTDJnGXBkO1per4/1/lgjB7HaIcb80iJy/xzhw9YmyINjjlzdIy2O1X42g2oi+yhCOCoV+ccrR1u57/GRe05UqLRexHLPAEexUYIg0HEDQveMvJd/XoMq9UDq3iI1fVFxRa4r75T/baVB+bZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788736221; c=relaxed/simple;
	bh=0lb+aqaKh64616am5jkUmapOYR2wDy1jfnzJIOdVr9g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=e1DwxWjSA26SQ8Ki4xrJSG/V3Smo/7ch8dC4KgH7tP7as8e4Ifv2SLOLUowqCeyXtiefcrsBnvUlAzio731LILfWq9sSMRcfy90mEdH26omO4weNIJil16mOpHc61y0CL7edRKHeiBpGC+8qJI9kmit2M4G6cGLVhT3DikRvM5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fHkC6Fbs; arc=fail smtp.client-ip=52.101.56.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fHkC6Fbs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nBEisbPC7MqK6rSP/68DunlB7e4n1IIBsGLzIP8P1NcU1uuAou/GIA7knVODoIwNVF8e6z0NUCHLlmrmb5p3o/MaK6YbXxSMjUDaZIO5x1dIqgm59RYpI2cyQO5CdLCGi1Hdbc0C/8AMaq2DhxlaIWdbZswtmvKejQfoDpJFKCoaw8qVWJoKuS12QjLursGeDVufhDl6iYbXIoiviO6370Nip0q2U8OHjzOEUSmOnZy/gihOTAQLW1tOAH8EfR+ho0MuCHxsYiKt7Vs15zNO2hPocoZbFPHbsgE1kNV5Emn5oYfT0iGCD/IHCAgPzwjZXSNfCMZBHiWoby6Y5jJOIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PoU+SR/mfvOmmseRhzuxM0vMsIMpVMS4vHSkYHt6+gM=;
 b=A4DIOmLu9rGbS0O+kqOSaiT4KnvIRQZplib2WaeyhU/UMfuWjKa5Mvyq8fw8IL9eQEEfO80UTRj2dxUUThQ7q5+5NbaUzJFKHSumpvFahjIWQo2pyLs5gZCEw4tQ54yrcnb4suvmpaGNCUy8+L4kOnM6gLd6/LdZlwmVMzL0zppH47kDdRUfwPfl7JdGps7GhIvB6zxHADoJ3GHWYkI8JGYFiW1tpsCdKq4a0rzlgdy5yaoaOgtJJyuvfgV+fYI/OnTu1jp5fxOkXCyWxK4PDkdLXLWcmCqnH2UnG6VdYWUXK4RNW3a2jeUSozndPt2pMgLl+VUTavtN4CB0uFFB/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PoU+SR/mfvOmmseRhzuxM0vMsIMpVMS4vHSkYHt6+gM=;
 b=fHkC6Fbsv/N7xgXQO02njosSlcJK9FFyzpa7vtJsrvLEgeYnrgk5Kyuk1IGVr0V9FgA6RCUiJoGSWB5CH7H/ofscMk4xy93NOCOym1XHWeuNqX2gi8vxZYlsvUMVKNH2k1oj0BqwAHLf3eue2ZumiCIzuHEIppFaTaid+WJMCVh8jGi4xBZ4IucdMPovTqdY6r16RFA8vILLOsAk0LhwVTv1akoAwycR/+CR34rQBQf6tMPdmeBzWDmwZfqS+2IPMF1Wnt9s/RYzm15hqTmc/XBsBoUIz6QfuWl/SMhD71oXDnKq0uh8/fnLJPTODeLkjOO+SeGLQhZrJewnEh4IOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 LV0PR12MB136056.namprd12.prod.outlook.com (2603:10b6:408:3b5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Sun, 6 Sep
 2026 23:10:15 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0382.012; Sun, 6 Sep 2026
 23:10:15 +0000
Message-ID: <8ad883c4-378c-4cec-8f45-a38c97d0c494@nvidia.com>
Date: Sun, 6 Sep 2026 16:10:13 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/14] gpu: nova-core: add the GIN interrupt tree and
 allocate its vectors
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nova-gpu@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>,
 Joel Fernandes <joelagnelf@nvidia.com>, Will Pierce <wpierce@nvidia.com>
References: <20260903031514.1515905-1-jhubbard@nvidia.com>
 <20260903031514.1515905-7-jhubbard@nvidia.com>
 <DL7FN5S6RSRI.JDTB3MREKFVA@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DL7FN5S6RSRI.JDTB3MREKFVA@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0123.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::8) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|LV0PR12MB136056:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bfa718c-ec45-4b11-5a0a-08df0c6c02c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|10070799003|7416014|376014|366016|5023799004|11063799006|4143699003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	5neMNpKURjMBVtdPr5ztE7ca5Poqgdbl6rDQ3KKyxgNcvGXJR/DNch93Hz1Pro+1ufHITEaHzQXDoTX08WpJJa+wy1adH2Jkaw/Db8ePG7RuwQpvgJDZkxfwW7v47vzCMd+bee14iwz21eZs9jApdqhj/5eJsF4DF0T37u0K7XFnTAA/TJlJoK4205gAQ7bnaaEpebU0tE+t4CxBfgcUQgd1B7pH3wPB2O16z13uubcFSIglQ/f7FPUR3dzgFuOT0h0ifSg9CBpjL4YJ1yxBaaKH0CMsEHdJLkho3rfkgAVcdjz9W6zdlq6PAB9ksD6gug7eoXRvnvHbNIuVZLXVjLhJLC3k27EnQbRxtuNUCjgRMtHCYRsQf2+UvNCFdappKPaQ4t2Z5KSRoexSSSGLZLC2ShI05ohr00IeeDWZ87nnguey+cDYETxdy7BwEGIeWUccT0DtsSjY+Ujv/de1/BPUHpTTZnewPJBJYcD9V/ud9q0E+cRihpFIkZbUVum91t/MXlXNljMsSUJwqWDjP4U0VEdw/X8hGFHwbA5Gb/zddrDxULK1HBjyWL2P+3FG4NmIU20LWb4f4UyPssG0yCK3kwV14GjfKB82jcDWBhzLEF6wxw68ko4n23RIg98SVGl5JQpsyVGQ03fAu4KusUul5dN7Ay47ftyfQdiS79Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(10070799003)(7416014)(376014)(366016)(5023799004)(11063799006)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVlHL0lvNEQ0ZHYzNU5zZGZQSWhaRWdSLzA2dmk4L0ZmRk9qdzIyU0Fsa1N6?=
 =?utf-8?B?allwUEkyL2RHV1dORE9QZk1CajZacG9zT0VCZGhSbXkvbzVWY0gycFNkLy9p?=
 =?utf-8?B?R3c4cnlkeExhMkd0am1nc1lnUWR5b0tiaGhQRWMyaXh2aGlsMzZ6K24wQnBm?=
 =?utf-8?B?aXJ0OUNoT1czUUNVK0dZT200L2FUMzN5bjluSm1kTytra3Zjc2pyb2hmTFdp?=
 =?utf-8?B?SWI4R1dNOVFpdk9XenYzUDBXN3BoUkNwd3VCUzgyOWNEK3VBcjMvQ0V5aW5I?=
 =?utf-8?B?WmQ4bkhueW9CbFlpVE1GQjR4cWZHNUlKcFNZSFZyYkIrRWFxV3lOYk93am9U?=
 =?utf-8?B?aEJFbWp5Qk9SNUFtVm10d3NDUHNNd3BnRFNpMko0cFRPY3B6WmJrd3NSeHoy?=
 =?utf-8?B?Y1ZGRXV3UHorRXlmdVM4c2ZJei9lWHhIc2tRQ0w0RDB2YU9Dc3BkQktlQ2JH?=
 =?utf-8?B?d1I5WXJIOTI5b1gzQkRZUEE3eklTR3VLcmRTTUw3RzBmRS9zalhUVGY4ZGx0?=
 =?utf-8?B?dklicDdsem05TmxGUE1kTlJ0bG50bDFrL1NNQXE1eVNKU0JDdHhxUEdyU2s5?=
 =?utf-8?B?YzJTTGNwS2psMXYyTFhwUGpHZHhSNk55dnNuOVVicHMzNXVZdW5oUlIxSUpG?=
 =?utf-8?B?eUJnL0lQekxxT05sQWcyR3VSbHFhdTRCMWxXSGkySGNZVzNyY3BERTQvLzZQ?=
 =?utf-8?B?aHA0V1RKbHhnWkNoamtVQ3ZsQ3BEa2kwNktJR0hzeDVLQVd5c2pvTlFDbGs2?=
 =?utf-8?B?Y0xqNWt1OGlHME01WVdQb1pLRVJSZFVYZ280YnNURWlzRUZkVjNxdVAzM1Bt?=
 =?utf-8?B?c3hUNU9SbnFGYVNjS1R2NjRhQXZ4OWdoSDJlSHlnWkhQY29UcUUzbkR0ZUM5?=
 =?utf-8?B?aUZ4Y1YzaDBGb2lBODFoYnhzQURjQXZHTGNVU0xTcDh4aEQrUVVDV21BSVZ4?=
 =?utf-8?B?aEdSQzYzRURRS0FoclhNSllpTWM0NVdBTU5US3FhMGVDUkFYZTd0aHJoOFlS?=
 =?utf-8?B?R25JM0drNTBuYTQ3LzBkRCtnYTJRMythTiswTWs2SHVxcDdIc1kyQjF3VDBl?=
 =?utf-8?B?bFRTQ1ZrdmtHTHlaQkNPMEZEMXNZYlpVZ05MWE1Ia1dRR0JOZnVha0RCV2pB?=
 =?utf-8?B?aWREQ2xEbzNPTHdmWWZ6THVOZlduVHhJZUFrS3h0L1FVZms5bTdQcmNBZDBz?=
 =?utf-8?B?UkU3NXYzUk04Vnp1aW10ZDBiTXNEM3BZb0RqdDAxcXdhT1NlNGFreUFsYWtX?=
 =?utf-8?B?QWlrdkdKTFhVWjNwc0dZY0JBOGNYWjUyeUtrUW9aUXphUlRHSklTWk95NVNq?=
 =?utf-8?B?S3h2Tkt5UStkQjBMK0xwdGtFSHY5dEg0NURGRHNSdTJ1UVB2ZzZsc1hWOXJP?=
 =?utf-8?B?QTNQK2dGT2xpRHBjam4xemhxTVlLS0ZWejhsU0lPVHVUMEdKSWR5NThhL0tl?=
 =?utf-8?B?VEYyTzkyc0xSSERmZElGYVVtUjM4a0YxTVVRN3NhcVRSWVpBYjZrU0x2cGY3?=
 =?utf-8?B?VWpFQyswQTBpOVlWYWJRR1h2WDZMUnBrdjk0TnBHNk9oOEdMWW53TFAvRWVG?=
 =?utf-8?B?UFFQcTNhaWRxQkF6UnhLUzdsTjB5Q2Q2ZzZnS1VYTGxLQzM3WUtwa1dxRzIw?=
 =?utf-8?B?bWlCL1VSUU10NkdUUmhFbkFJU1FFKzR0cGZIMXV4b05QRVl1NVBuYzRiTVRh?=
 =?utf-8?B?dk1RaEFkK01DajB3ZGwvSVUrTndWRDVRdnNkNEp0YVA2VjAybnY4dWtQamdt?=
 =?utf-8?B?Wmhvcm5aeDRYazArQnFCdDdYTW5TOVpEcitIUlp5eGN3S0pySVpSNktQWTBk?=
 =?utf-8?B?akZoaWFxTVY3Vnp2MnNKSTM2RlBnSFJ6QXh4eWpBUHFWcDBHUFVENDl5Nm1l?=
 =?utf-8?B?T3IwYjcwS1NVSVU3Nzc4SUc2SjFLKzh4RnlwMVNBVzFEeGkvL25MNWFGK3ox?=
 =?utf-8?B?SEtsVmh0Smh4UWt3NWtKR213R25Vd1F3UFpYdzVaVHN1YlYxQ1JtY1ZoRjYv?=
 =?utf-8?B?eHBxSDRWc2o4aStLL01kL3MxUCtrQ1ZkVFgrR3pQbTIrQ0dxbGtBbmFsRnlV?=
 =?utf-8?B?VDZKSjl3a1Y0VGJMdzNtbWltQklLMXdFOTdJRFhxVmJnTSs5bDM4RWFHZkF4?=
 =?utf-8?B?VTBISnhLMjJwQllVd2RkcEoxa0N0WkkwL1k4MFJVRE5xOXMwSlFSRXBvNUk2?=
 =?utf-8?B?dzh5VUZJbkw4c1ZXNEJlcXNWallWUmNBSlYxSDZWeU5nN00rb01ZR1pBaStZ?=
 =?utf-8?B?VUw0N0FEbS9Mc3BDWmdvWWFPc1Qzdm1KVTkvNVp1ZnRFbW92eER3eXJOa3F3?=
 =?utf-8?B?VTBUZ1JhcHgyVlQrZmFSUzZNMlRueXlkWVJHWWRTaWtLTjZCdDk4dEtGZkpQ?=
 =?utf-8?Q?i3FiwpefCeTovCZQ=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bfa718c-ec45-4b11-5a0a-08df0c6c02c8
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2026 23:10:15.4109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UQafABv0rFRafDnI728pQoBgB9Vk5ATMe995xS1stiH7Vr0xcyoSiGx2/ijr9ftTnhkeklGLtc8I6WLK5NE+ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR12MB136056

On 9/5/26 6:55 AM, Alexandre Courbot wrote:
> On Thu Sep 3, 2026 at 12:15 PM JST, John Hubbard wrote:
> <...>
>> +impl SubtreeVectors<'_> {
>> +    /// Returns the interrupt type these vectors were allocated as.
>> +    pub(crate) fn msi_type(&self) -> MsiType {
>> +        self.msi_type
>> +    }
> 
> This method is not needed. It is only used by sub-modules, which can
> access the private `msi_type` directly.
> 

Hi Alex,

Thanks for all these reviews! In addition to applying fixes for each item,
I'm also doing the following for the upcoming v4 spin:

a) Rebasing onto Gary's IO projections, and taking full advantage of them.

b) Fixing up all comment prose.

c) Using a type system instead of returning a bare u32 for some of the
interrupt status reading and clearing.

I'm keeping it up to date, including testing, so it's ready whenever
you get tired of looking at v3. :)

thanks,
-- 
John Hubbard

>> +
>> +    /// Returns an [`irq::IrqRequest`] for the vector that delivers `subtree`.
>> +    ///
>> +    /// MSI-X gives subtree `N` its own table entry `N`. MSI raises its one message from every
>> +    /// subtree, and nova-core allocates a single entry for it.
>> +    ///
>> +    /// # Errors
>> +    ///
>> +    /// `EINVAL` if `subtree` is not one nova-core services.
>> +    pub(crate) fn request_for(&self, subtree: Subtree) -> Result<irq::IrqRequest<'_>> {
> 
> This method can be private.
> 
>> +        if !self.serviced.contains(subtree) {
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        let entry = match self.msi_type {
>> +            MsiType::MsiX => num::u32_as_usize(subtree.index()),
>> +            MsiType::Msi => 0,
>> +        };
>> +
>> +        self.vectors.index(entry).map(Into::into)
>> +    }
>> +}
>> +
>> +/// Allocates the interrupt vectors that the subtrees in `serviced` require.
>> +///
>> +/// Every subtree nova-core enables at `TOP` must have an allocated vector with a registered
>> +/// handler, or the interrupts it raises are lost. Linux masks every MSI-X entry a driver did not
>> +/// allocate, so the MSI-X request covers every entry up to the highest serviced subtree. A part
>> +/// whose MSI-X table is smaller than that falls back to a single MSI, which serves the whole tree.
>> +///
>> +/// # Errors
>> +///
>> +/// `EINVAL` if `serviced` is empty. The error from the MSI request if neither type can be
>> +/// allocated.
>> +pub(crate) fn alloc_vectors(
>> +    pdev: &pci::Device<Bound>,
>> +    serviced: SubtreeSet,
>> +) -> Result<SubtreeVectors<'_>> {
>> +    if serviced.is_empty() {
>> +        return Err(EINVAL);
>> +    }
>> +
>> +    // One entry per subtree up to and including the highest serviced one.
>> +    let entries = serviced.span();
>> +
>> +    let (vectors, msi_type) = pdev
>> +        .alloc_irq_vectors(entries, entries, IrqType::MsiX.into())
>> +        .map(|vectors| (vectors, MsiType::MsiX))
>> +        .or_else(|_| {
>> +            pdev.alloc_irq_vectors(1, 1, IrqType::Msi.into())
>> +                .map(|vectors| (vectors, MsiType::Msi))
>> +        })?;
>> +
>> +    Ok(SubtreeVectors {
>> +        vectors,
>> +        serviced,
>> +        msi_type,
>> +    })
>> +}
>> diff --git a/drivers/gpu/nova-core/irq/hal.rs b/drivers/gpu/nova-core/irq/hal.rs
>> index 1ea677e37e56..07604458dbbb 100644
>> --- a/drivers/gpu/nova-core/irq/hal.rs
>> +++ b/drivers/gpu/nova-core/irq/hal.rs
>> @@ -25,7 +25,7 @@
>>           Subtree,
>>           SubtreeSet, //
>>       },
>> -    regs,
>> +    regs::*,
>>       MsiType, //
>>   };
>>   
>> @@ -63,7 +63,7 @@ pub(super) fn rearm(self, bar: Bar0<'_>, serviced: SubtreeSet, subtree: Subtree)
>>           let subtrees = match self {
>>               // The written value is ignored, so any write rearms delivery.
>>               Self::ConfigMirrorEoi => {
>> -                bar.write(regs::NV_XVE_CYA_2, 0u32.into());
>> +                bar.write(NV_XVE_CYA_2, 0u32.into());
>>                   return;
>>               }
>>               Self::TopEnableCycleServiced => serviced,
>> @@ -71,10 +71,10 @@ pub(super) fn rearm(self, bar: Bar0<'_>, serviced: SubtreeSet, subtree: Subtree)
>>           };
>>   
>>           bar.write_reg(
>> -            regs::NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_CLEAR::zeroed().with_subtrees(subtrees),
>> +            NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_CLEAR::zeroed().with_subtrees(subtrees),
>>           );
>>           bar.write_reg(
>> -            regs::NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_SET::zeroed().with_subtrees(subtrees),
>> +            NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_SET::zeroed().with_subtrees(subtrees),
> 
> There's a bit of unneeded churn here. Let's settle on the import style
> in patch 5.
> 
>>           );
>>       }
>>   }
>> diff --git a/drivers/gpu/nova-core/irq/interrupt_tree.rs b/drivers/gpu/nova-core/irq/interrupt_tree.rs
>> index 5aa447cf0ec4..0b4dc2fc8ea8 100644
>> --- a/drivers/gpu/nova-core/irq/interrupt_tree.rs
>> +++ b/drivers/gpu/nova-core/irq/interrupt_tree.rs
>> @@ -1,18 +1,42 @@
>>   // SPDX-License-Identifier: GPL-2.0
>>   // SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
>>   
>> -//! Vector addressing in the GIN CPU interrupt tree.
>> +//! The GIN CPU interrupt tree for one PCIe function.
>>   //!
>>   //! A vector's number fixes where it latches: leaf `vector / 32` at bit `vector % 32`, and that
>>   //! leaf belongs to subtree `vector / 64`. The types here keep those three views apart, so a leaf
>>   //! index, a set of vectors within one leaf, and a `TOP` bit cannot stand in for one another.
>> +//!
>> +//! Servicing a leaf has a required order: read its pending bits, then clear them. Clearing a leaf
>> +//! before reading it discards every vector latched in it, and nothing reports the loss. Only
>> +//! [`Tree::read_pending`] produces a [`LeafPending`], and only a [`LeafPending`] can clear, so the
>> +//! wrong order does not compile.
>> +//!
>> +//! Serializing access to the tree is the caller's responsibility.
>>   
>>   use kernel::{
>> +    io::{
>> +        register::Array,
>> +        Io, //
>> +    },
>>       num::Bounded,
>>       prelude::*, //
>>   };
>>   
>> -use crate::num;
>> +use crate::{
>> +    driver::Bar0,
>> +    gpu::Chipset,
>> +    num, //
>> +};
>> +
>> +use super::{
>> +    hal::{
>> +        cpu_interrupt_hal,
>> +        PciIrqRearmMethod, //
>> +    },
>> +    regs::*,
>> +    MsiType, //
>> +};
>>   
>>   /// Number of bits a leaf index occupies, covering the `0..16` leaf register arrays.
>>   const LEAF_INDEX_BITS: u32 = 4;
>> @@ -113,7 +137,7 @@ pub(super) const fn contains(self, other: Self) -> bool {
>>   ///
>>   /// Exactly one bit is set.
>>   #[derive(Clone, Copy, Debug, Eq, PartialEq)]
>> -pub(super) struct Subtree(u32);
>> +pub(crate) struct Subtree(u32);
>>   
>>   impl Subtree {
>>       /// Returns this subtree's index within the tree.
>> @@ -131,7 +155,7 @@ pub(super) const fn into_raw(self) -> u32 {
>>   
>>   /// Set of subtrees, one bit per subtree, in the layout the `TOP` enable registers take.
>>   #[derive(Clone, Copy, Debug, Eq, PartialEq)]
>> -pub(super) struct SubtreeSet(u32);
>> +pub(crate) struct SubtreeSet(u32);
>>   
>>   impl SubtreeSet {
>>       /// Returns whether `subtree` belongs to this set.
>> @@ -240,3 +264,262 @@ fn from(vector: GinVector) -> Self {
>>           vector.0.extend()
>>       }
>>   }
>> +
>> +/// Clears the enables of the vectors set in `vectors` for `leaf` (`LEAF_EN_CLEAR`).
>> +///
>> +/// Shared by [`Tree::disable_leaf`] and by [`LeafEnableGuard`]'s [`Drop`], which has no tree to
>> +/// reach through.
>> +fn clear_leaf_enables(bar: Bar0<'_>, leaf: LeafIndex, vectors: LeafMask) {
>> +    bar.write(
>> +        NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF_EN_CLEAR::at(*leaf),
>> +        NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF_EN_CLEAR::zeroed().with_vectors(vectors),
>> +    );
> 
> Mmm, that's not the syntax I gave in my review of v2 [1].
> 
> You don't need to repeat the register name:
> 
>      bar.write(
>          Array::at(*leaf),
>          NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF_EN_CLEAR::zeroed().with_vectors(vectors),
>      );
> 
> Please make sure all sites where this applies are fixed.
> 
> [1] https://lore.kernel.org/nova-gpu/DL3SD82Q6C81.3G32WDNS642Y3@nvidia.com/
> 
>> +}
>> +
>> +/// Clears the `TOP` enables of every subtree in `serviced` (`TOP_EN_CLEAR`).
>> +fn clear_top_enables(bar: Bar0<'_>, serviced: SubtreeSet) {
>> +    bar.write_reg(NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_CLEAR::zeroed().with_subtrees(serviced));
>> +}
>> +
>> +/// Clears the pending vectors set in `vectors` for `leaf` (write-1-to-clear).
>> +fn clear_leaf_pending(bar: Bar0<'_>, leaf: LeafIndex, vectors: LeafMask) {
>> +    if !vectors.is_empty() {
>> +        bar.write(
>> +            NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF::at(*leaf),
>> +            NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF::zeroed().with_vectors(vectors),
>> +        );
>> +    }
>> +}
> 
> This method is only ever used in `LeafPending::clear_vectors`, so let's
> inline it there.
> 
>> +
>> +/// Returns every leaf a tree of `leaves` leaves implements.
>> +fn implemented_leaves(leaves: LeafCount) -> impl Iterator<Item = LeafIndex> {
>> +    (0..leaves.into_raw()).filter_map(LeafIndex::try_new)
>> +}
> 
> This looks like it should be a method of `LeafCount`. In this case, I
> guess the name can be simply `iter`.
> 
> <...>
>> +    /// Clears every pending bit in every implemented leaf.
>> +    ///
>> +    /// Disables this tree's serviced subtrees at `TOP` for the walk and leaves them disabled, so a
>> +    /// caller that wants delivery enables them itself once it is ready to receive. The leaves
>> +    /// cleared reach subtrees the driver does not service, and the `TOP_EN` write does not.
>> +    ///
>> +    /// Call `drain()` only during probe. It must not run concurrently with an interrupt handler.
>> +    pub(super) fn drain(&self) {
>> +        self.disable_top();
>> +
>> +        // `TOP` summarizes enabled leaf bits, so a vector that latched while it was disabled does
>> +        // not appear there.
>> +        for leaf in implemented_leaves(self.leaves) {
>> +            let pending = self.read_pending(leaf);
>> +            if !pending.vectors().is_empty() {
> 
> `clear` already does the same check (through the now-inlined
> `clear_leaf_pending`), so it is redundant here.

