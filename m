Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011071.outbound.protection.outlook.com [52.101.57.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3285C37F8B2
	for <nova-gpu@lists.linux.dev>; Tue, 22 Sep 2026 02:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790044779; cv=fail; b=Qa0loR/Coz+vs3jmew4/F4xblf0VSPh5Cpco/c2F8xFsSCWeF9HLJDQGfPhOkeMOkdY3rOcqhNZfa2lxDA47q1hHZSzqtxIYC7AbTfFNW9fdWUgWrIZKWS9lKRP/0VJsIRDsavCB9LeKjopqYzdpbEJeWNSs24Nt1F5lw01CTus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790044779; c=relaxed/simple;
	bh=hPVefLdL8nu8ZxChLc19CJtNRVXNIWRrUJu2BsRfEbY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NiYgs6kYArOqQoTLv6c0upFbbedAsTSm1Son7qkTxeyOUGi7bddDzgxNmuFUXoeI4K1KxU0Tvz59Y5VW9FMhAIFwshaTf/f7TCcYQbClVC3nGaduCe5lgrKC5DrO46HB6fcmUKJBcrakYd1Nwq+9LHBebo62pHofbyKo+d1PBls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AstiSsJY; arc=fail smtp.client-ip=52.101.57.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AstiSsJY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vGYpVYwhcfK4yvL+LpED+D0RAEs9Nr32vc1CxjQsxUDmug1rN0Crw7n0uYPFNOlYCStXu6vRiGv7k9hFXyKABBhzDwTLB4zR4Is/U4V7QQQnR4X2noiN+NlEXBp6s+4xQXaAmLh4/JThT/0Zpun4sGvmv9soL9sGh2QdFj2ubufBjLYSknqe+DQMnxjaltw38HfWdktG/xB64I9FbGzaX3aZX7f/Wcl0jKDnSVEXgbDMNecbPpaKoHtUvEtQnr0PejoGPF+B1cPIRdK+xzC0NzaX5CbhiTaVMqSxZ5YKP+7yj+JVePRXi3wNCjx1oDN/alb+yFrT0Wd1k20P7DIqUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RD0W/hWpa3xlGreJMt2F9MU+0Iff6vSAuzVsutO+3Es=;
 b=MD7v2ZWjyeRJtXLqHG2LPxgt2Ttk2/447RfrdNeT6/trd3hbES6CsUE+BMxIXm+elSV2gwLT+SCdZIHPCvSVZKMUIoPKqZss//+U3t6J1IdVqzab730BPkOYFHkxdmVVYrE5EOhOYzbjZCXxfoNtXQxerHWwIdOMAClmV4hc5rP5Pt1X83Vqj/qvF994xLN8q59PwnCIfAOaCduvtGmoSHUyjO+LsETEXwlcGKHzXBVYFcx/VVmW2Hr8O6hPAeTZGNV1qRuqqkoBIN0s1OmotSo/PxvIKz7S6zEOI3587QThWkKK7JCwW2RXlrfWwa08zC7XYJnK709eDT1QTBlUdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RD0W/hWpa3xlGreJMt2F9MU+0Iff6vSAuzVsutO+3Es=;
 b=AstiSsJYjfjMgbYwUh1iHQFZEhGCp/c7+1SN2QS7oVcqljgDS4CvtKE9jFVPEaAvS7jmQxvm3qvWgO4kUv2vRzl65MrFNXpnETVMVgh8X02X1RdZ0Xx6jY1CIcClln337wEO85uKTe4l3VkTacmlHHbJjvzvqHCL+bABbekCItPv+a16lA16Iig1HeYIyIq2sT0fTjeQLkRFlpXSnDvrJJcQJNHaMfMCs1zAlEygsa/dtmRc8cX0q/ZMqDAz94CxOpyKe9ftoC3uag1vKML4veY1tIwAZaGfYyQQO73gmYbqo1Eo6hjeNpU2xxTWp2tF+MoHg4+zCJJzVjfxtz9VoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB9550.namprd12.prod.outlook.com (2603:10b6:8:24e::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.16; Tue, 22 Sep 2026 02:39:28 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 02:39:28 +0000
Message-ID: <284369d1-72fc-430c-85c9-bb3765828ca5@nvidia.com>
Date: Mon, 21 Sep 2026 19:39:25 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/33] gpu: nova-core: separate the generic falcon
 bootloader from FWSEC
To: Timur Tabi <ttabi@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>
Cc: "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, Zhi Wang <zhiw@nvidia.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ojeda@kernel.org" <ojeda@kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Eliot Courtney <ecourtney@nvidia.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "aliceryhl@google.com" <aliceryhl@google.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
 <20260918010719.1176945-14-jhubbard@nvidia.com>
 <97808ad4a56c5fd5977b61beafbf36d7ed65869f.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <97808ad4a56c5fd5977b61beafbf36d7ed65869f.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR15CA0021.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::24) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB9550:EE_
X-MS-Office365-Filtering-Correlation-Id: 9453d633-8e55-458b-4fbe-08df1852b946
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|22082099003|18002099003|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	SzLN6y4yKFiVo/LEvcHwOWpN5mrUkeE7exTgzqw6f1aTwUF6pc0jFhOskZKM5vIB/J3ev8j6+H/NIfvArD6ZxSt1rr6Cp56EVVX2ckMs7bKRXOU6J6Nbep0IEIDg8ZNpr42qTzLyxv4i0yoiFyoqK08g9c9Vrgk6WWlz7w50pjLtx3/la7JlMk6mGV7KWMH3cWEWO3gm/8MxdmDRp2L3OfCV5L7neNlMSaRT4lM/It0v3TeclSLQd5ORCWGT9wUszgn+dmXVSYPdhRjAcfhCuoiQI+V60ghIR2Oi+TZfQrpWAC3L547422lWPt37wVscFSB4FR2DskY8Y18EQ67HLfo59Wrg6gDqe71K6I3dlvWEFPdxS3c9XEv5KwClBBqLz4ljI1Fc4myg/d7GtjQ6XMMCFVX6hpX1eeqhIGf0xvrKe8Dc0mMkw57cd6YA0rKwIHgjBZRSnXb77snzeJw1db2YW78CkcMbm1kxwqZBexWRQG0IyU1A9NWfPqhfPiHqdxlBDXUF/I3XcXdw3aYHBs+HCrPOT+Qvw14gr0BaFkVkQFQlJQ2nRaGxOiAyGqbN9o+Eh28q6PgRzglJ7sHNEtqOOJW8E/TfenMwHej6hiRhiXphMQe1e4p91ItsZ+kWpWtj6By1tzSpEidCiDzZhs60wrsePjU+Wk4aS7qNvmk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDBhWmlVUEhXbzRpRnVWaGNld2EzN0k4S0F3ZGpzbEd6QVpiNUszNjIzMXdK?=
 =?utf-8?B?ZkhnWFNjNEUxMG8xeWZFdHI5MkRZcmdFemVtVVRNNDZTbGhSdzRHamZPRVVI?=
 =?utf-8?B?QWZ5UUtkd1ZrV0NPYjg2N2lpQ1E4QklsN0hzeEowaVY1T2J0Ti9zUzFYRC9T?=
 =?utf-8?B?cGRGYTRQT0hHWHJtKzduSWE4ZW1IQjAwandIbTY0TmwxdmFEekp5UkhsRVZp?=
 =?utf-8?B?MGI2NFBxRkhPL0pZQ1RZa2NhSllsOVpVczRVRU8xcjVOdzBERmFoUmhZT21Q?=
 =?utf-8?B?dTU2K2FFcXJnNG5peWJ6TlNPNmVabzEyTDA0bkQ1R3FSbnM2bmNmTS9CMFRM?=
 =?utf-8?B?blBBd01hcGlFV2cvODdIZzI4UC9ST1dZRllIUk9sajl0eHphNDlaZzcvQXc0?=
 =?utf-8?B?Wi8yayt2WTdmRURhUGdZZlFNaWtEZ0ZuTkhSVUh6Yjl2czJGVGFDSjlkc3ll?=
 =?utf-8?B?VUJKN3dSUHM0eFBBUXBHS21IaTFQeVAzZlJMU0plMG9EOVI3bmY1Tk9oQnZs?=
 =?utf-8?B?NjFIYlpJV3IrRjYrLzJob1kzY1JOWW1HeVVHRDJrMTU5NFg2TU1CSzd4c2hY?=
 =?utf-8?B?UmhUWXdhQi9ucGpzdGNhM2RCcUZBUkpiOXd3U0ZiVFJlNHdOb2hkYnV6UFp2?=
 =?utf-8?B?VVVkQ0k1M0pQQnJ2WTEyYllkbENpQzFkNUNOM2h2cFJzRTUrRWxQbTgzVTNx?=
 =?utf-8?B?VDg3ZXFGTTBIbEZ5RXRJdFNPbU9va0lPT1BxYkp5ZzlqVHhWZ3Irb3VUbHVi?=
 =?utf-8?B?b05yVU50OFl5YjRneU11MTNyZENlN3JFa05CeHZ0UStYUFpYbjk5WFVjQmhh?=
 =?utf-8?B?Vm1FNExKT05tZ3E0OVBnMGNhUU1ueHJjSkVnNkVFYWkvWEdkWktMT2dFVkVs?=
 =?utf-8?B?Mis1a1U4VGtSb2VnRFgrajkvYW5tYlNYVGJMSFN0eGYrU2NTNjdyT0hMVTlL?=
 =?utf-8?B?QlVjaVhYWHAzV3NXc1dlenV0Y000d1dnSDNsR3NkZHV0bXBYelRtQWZHMFY0?=
 =?utf-8?B?clhVeVpFMUJmRWZFZ3JiYmRwT2VDTWNaL1lxQmx0Wkx6UWtSNWZKSFQxMDhR?=
 =?utf-8?B?OGRMUTIwOEc3Yjd5NCt3WW5oeDdGRjNta0xlUmxVZUxYNE5tVS83TnV0TXN0?=
 =?utf-8?B?WFdyM3NhelozY25sWXcyRE12TTFEMEtjVzlyODdXMXBLcG85VUxpU0ZYK0Rt?=
 =?utf-8?B?L04vQXZVSmxpeWpqZEpRSjVCZlFkaHhMZlZnWVdpcTV1V3VTMVFsWWFwbFRY?=
 =?utf-8?B?M2Rhc1M1aXN2TnNCNXZwVGxXOWs3empCeEJidW1hS0haenVGTHNOZ3NRSHNs?=
 =?utf-8?B?UURONHVYdkFTNVBkRjVFTmhVblVvZGx6Wk1sbjJvMFRxOHdDY0ZISWVkQ2h0?=
 =?utf-8?B?bkw2bDY2MmpibTBLUkdRaFpPa05Nd2g5VEFmeFhmNHhJQmJVUXg2aFFnY3ZR?=
 =?utf-8?B?NlQ3eDc0U095VTI4SmY3Y3BSRnRHVTk3a0ViSDVDeVpUS3VMdW1VR3ZBOER3?=
 =?utf-8?B?dUpZb1JFZEZKZXI0Y2FTanA5WG4yYzBER1ZvQ1VBbnNidVNTWHhCbkdYNWxK?=
 =?utf-8?B?RWZWbUZkMGV4ZWo3dkh3L1N6WlpDbkVoNVVYVnBqSGJObzJScjE1dDluQ1Zk?=
 =?utf-8?B?NHVXak5VZkxzYUxyNUd3LzZIV01pZHBRek1ad3M4dVFNWjl1OVVBZE5samsr?=
 =?utf-8?B?N1UyMmp6OVdLU2IwOGpnTVk0SmxBZnlkU1o1YkFua1lVT3hiV1lhR293RWZ4?=
 =?utf-8?B?QmtlSnYva1NUR1B3bXNqMUVqVzhZTy8yNm90VUM2SkJVNENyaG8yVWcxSFRy?=
 =?utf-8?B?eGZFWUZmaFdPT3FicEo2dk5IT3NJQmtaSDNNY3U1TjZKM0g2KzZ2eUlObzk0?=
 =?utf-8?B?ZUIwZE5PbEZQRHlLMHJGZ0JxWld3N1FINWRKMXZkTkJ0aHpvWEhscExnOEwz?=
 =?utf-8?B?RVppbEtiNng3WmFydGJuMzNMd2MxbjdwOFI5bWEyUUExc2lKV21ZaUdQUGhi?=
 =?utf-8?B?a3V0T293M1RtOFFTLzhvcnlmN3krUWl3Ui9mU29rVTZNbDRjZjZ1cUlZWlhM?=
 =?utf-8?B?MkpsL29EanR3aGtaWUVyYWxxaFcxdjhkVXdwZzc0eXdnclNqdHpyc1pTWHdy?=
 =?utf-8?B?ckQ3bm9aSFdqZjRhSkRoVk95M3lyZWNwNnp6RXpnOGpnSm1LVTdwZkEyTk9B?=
 =?utf-8?B?M0ZGbm1sNFJ3eSt2L3lEbHhrZE1TYjNDenU1UGVJRGxiMzAyLzZGL2RYT1Ar?=
 =?utf-8?B?Q0ptbXA2bGhGWlovS2FxWXF1aDNBcmRlRTdXcmZwZ1B0MklaZTNVMzJVUnEr?=
 =?utf-8?B?RDBLR3AvUXBoQWtVUUJMbWxHamYwY0ZwdHJzdENPMCtqNlNBZEllUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9453d633-8e55-458b-4fbe-08df1852b946
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 02:39:28.6420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ranxc/us0AZ9ToOalr6TxbTkBdymhcuAxurxADef+5/+/C6U/+j6OyOMrTZSBCGeqbpAfUKdC0h1ratt6b51og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9550

On 9/18/26 3:04 PM, Timur Tabi wrote:
> On Thu, 2026-09-17 at 18:06 -0700, John Hubbard wrote:
>>
> 
>> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
>> index 9015de965a53..04e35cbcb6f0 100644
>> --- a/drivers/gpu/nova-core/falcon.rs
>> +++ b/drivers/gpu/nova-core/falcon.rs
>> @@ -385,6 +385,14 @@ pub(crate) fn new(
>>          })
>>      }
>>  
>> +    /// Returns the size of this falcon's IMEM in bytes.
>> +    pub(crate) fn imem_size(&self) -> usize {
>> +        let blocks =
>> +           
>> usize::from_safe_cast(*self.pfalcon.read(regs::NV_PFALCON_FALCON_HWCFG).imem_size());
> 
> Why is this `*self` instead of just `self`?

Because the star is not "attached" to self, actually. Because: A method
call binds tighter than the unary operator, so the above is actually
dereferencing the Bounded<u32, 9> that imem_size() returns.

However, in order to improve readability, I've changed this in v4, to
use usize::from(...) instead, the form that the fb HALs already use for
a register field. And also done that for the two GSP pointer reads in the
big switch-over patch.

thanks,
-- 
John Hubbard

