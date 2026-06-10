Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011052.outbound.protection.outlook.com [40.93.194.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CAB3909BF
	for <nova-gpu@lists.linux.dev>; Wed, 10 Jun 2026 21:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781126495; cv=fail; b=L4EAPswFN6OsohE8MzJznmbba7g/vRFGsfpXdEi6+mP7gwxV8874mzHf84g7VNtP0aLhyZiIfmxV0p4RqqTq2bBPFYcnAnNg2B8RYnODLEHB+mHrMiIDn+RbYowGS0Q84j/bvwadRtJaUWQZGVNxkRPOV08hVvAjLMy3oqt7UyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781126495; c=relaxed/simple;
	bh=SWIqwRqdUu6/XhmN1pRKr2vFylFVi0pihXFaB558XZo=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lCCeVhM1RTQf1xEMTLfJy1rjOx0nd/Epga/INu0gA3DGITGMY1AfXsreiPMPCa0njOYFJfvIA8YtEYZ5hlASnqb748JuEuSWd4mdxmOxE/mrEH75wVhLawerTApSEX5xtHwA9qt1svFr9DXp3rKJCd4zYowBGkFP++JSKkEx33E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AIL0WGAC; arc=fail smtp.client-ip=40.93.194.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AIL0WGAC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xD2BU/JRY02mlKNhOT1xlM90YtfkxYBxxd5AKBLbbXvM/ZgVvlvyqiNYDeLlPh1cZSeEfvD22CTnrmeycnA0iSrcbdFvfbHp3YKwQJuaY2c1bILp2D3ICTwKHwVqCEpwM7pOXL4FlpAunKsP5b0cBPRLK3kzsphoFQ95z5xmM6LlcJhBxoXd5H0Ev2OMCAsygOuTOPUZV5C68xnWJydeZ6Fwc9lzZQXQRXegxA/uIxVGdNy5i5JvsqHaTNz2nI0RcjiT9lbGjM6+1juqsIa7danlJ52n6vL/jHQAS6HMui3S1lm5EDXMZc7A/Ac7kLKWCxNJvFeg+U5FHMU1OnHrCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p3ov5iolfNdIiGIfIsEZctW3/dAxfSSS9kCSnWnLMdo=;
 b=dOy1fwImhHeSZb3lG0GR4aW9miOMq5btc02Xp80KoQT8i6sQEtNGU/U8qnwUrF4uAyj7fmnV30ybpLsZYKJtb/e3ZV1Mkq7u1OEJcktfy1pw82IOf9GwHZaZAGopjlWYh6kZkFncQUmD47jIk5EfzW22YYmFEIvF85Y6bcIsYkFQiq2FthTzDw50NuWp2NuCBCh/ZTupwqAJAo8smpn3wUsK55zZmBJzylHOr/Qlz0mgDGKRBJ6eNG82RJOT9ChhI+0iNDPKRfQkyp87qM5xnSxnYVNinx/KF+TeFBN5hUP5Vbme0BNRTvF2vvrnm6eddQGxjDcpN98Mo/G9eYiOMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3ov5iolfNdIiGIfIsEZctW3/dAxfSSS9kCSnWnLMdo=;
 b=AIL0WGACO0h7m001JYQjLELzCXMuFVbsdzcpNIQ0gUCzRJkaUZcEKagz8t10/zy4Z8aWJybO3zCe7lrP3OmYxREsptgJGSEAb8DiZ6/pCHUNrMwRqDIOGURRLzTwo+hm4sMOu4SJSdQNDnOqEN5G4z9p/RjzQL7v4gpSVH6psQvq0Ye/VpVCWkE4O69l3leeIIgrtz1pQwrVhPwOxbMZ/1eRfSN0uYj6xN4hHbJe80B5JfU75B18mDzPVWVFTlDiJwTNjkRJp6AItNY1DcUcFVqd9hKc4C0z2TgMbl0UNT9AJdcaxCLAyaU4nOJpw3fVzjI2h1fuwnZRYyzTbgVD9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH3PR12MB8209.namprd12.prod.outlook.com (2603:10b6:610:123::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Wed, 10 Jun
 2026 21:21:29 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 21:21:29 +0000
Message-ID: <6a59666e-d8f0-49f2-a147-52d2b5c3e17f@nvidia.com>
Date: Wed, 10 Jun 2026 14:21:27 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] Transition Nova Core to TLV firmware images
To: Timur Tabi <ttabi@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>,
 "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>,
 Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
 <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>
References: <20260610174929.744477-1-ttabi@nvidia.com>
 <00492e63-a3f4-4ae1-8b95-192e2d651956@nvidia.com>
 <4c9168113597793d01fe9f3d60a5554cc1895433.camel@nvidia.com>
 <ee837d41f188af34e1d78231987b48a9cc287172.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <ee837d41f188af34e1d78231987b48a9cc287172.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY1P220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::11) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH3PR12MB8209:EE_
X-MS-Office365-Filtering-Correlation-Id: c4099a0e-f112-4bbb-e197-08dec7363c91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|4143699003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	0JBVqZJbcR2hqaM6MbQbNN90D8RhwqGczUmEiLApCtmFB24cW4RngVhW3AmPB1mbMeKHoqkf6vemwO9skT5jr7ujfPJQ+kFnLc1BWM2Iqa3DLMY9fmEKke++RmYq3dInPGAmkUbX9zZ9ti+hJ/QQD3LIl3Y1m5n9+WtuyFe15PYuwoRmX93CpMPwrxWkr4FAndDlBbHlIYNOv9qJp2HPdLhK4cFkdCg0O4CWDRDjLGd4NJ3dvmDxiwEaNt241fphB/7tQxzkFx8Ct29NA61itnWPYYW5ac2iv1RREjfDKZIkzDH6v1kw++ZmSBAU1b59nj5RvMnAXTZl1GK505Ho0Cvb20YwL52/kntp7P+IBDO7HYsphB/Q2SiASbmOovQ2MMCfZ/yuJ5TjQoUyJKZ6GhclI3Q6LrB/z1uellCbEYPG+PByLqbSS60xOB08cIXve+rEaio1Rf1DOZq+vecUrtp6ayeVnSP3924l/Nb/wJDPOowenn9yYPkbO62sA2tFWiteH2DTnSQH4hFkbljeFFsYJ75P1dP6KyMX5nLWPUJH84JBFPO6wGYLG6QnQRm+SQ/05vJphwAvzCsJ0KhUhQHSEU8tqhQObYFRl7VRAEPp/KP++kZCOgr2ANkLibCtddK4LbefbkDWxA1M+j6l1s/ngk6Jpwd9OqvK30Albio2JKFVy3KUfYn3ccT+kgfK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(4143699003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZnphUGtrbjRqM2NzR1Nvb2tBYU9GZmFrUTBDcWhQOGVtbnZ4WVBNTzA4SjVr?=
 =?utf-8?B?OE5tMjVuSkF0WHN0dW9vQjR5V2JVZk5IaWxLZWIraDhjTDdOdUIyQ09FYVNq?=
 =?utf-8?B?QU1wVUp2MUZLSEtlZDEzTlBTZmRyNXE3WkJyc0hnUkRwb2hkZkNOUjArREpE?=
 =?utf-8?B?eXJLWGpqd1ovV1lNdkE1eWdxSjAzZzZwRjNSdHc0K1A1SC9EZEkwejJBSlJR?=
 =?utf-8?B?YnpVenlrZFd1dXZBeGRZbXN3V3Mxa1ZpWUtWVDhBSmkrcEN2TFpTc0l4eUxz?=
 =?utf-8?B?RlNSUk9qSGVqWmZKb1lhWEJ5RHhQM2lUM3NwL0l2SFhGYThYTi8yRkhKbXJQ?=
 =?utf-8?B?YlNicG12djA2MnVQRlpKK2NvNFpva2RDR0wzQVlucS84ci81Z1Q5MDlVQ0lZ?=
 =?utf-8?B?Rm9tZlJIc0xEaE1HK2xjV1QrOWJqWWovQ01VZURid0pKdEJBenBpbHFjQnU0?=
 =?utf-8?B?RWhveGloYTM0bnpQU3o4T1h6TU5URUVyQjk2WWtuZDhyblpFVnlsV0daWWNM?=
 =?utf-8?B?cXlNdnkwY05rTk5Fdmh0T0ZVWEdMZlgrVkJBSjUwbklhaDNIbEtKYWZsYm9x?=
 =?utf-8?B?UFUxaG13VXNYbXA2RGl5L0xIekdqOWZlTkNBdDFEQkZReXBqcXlCalhUdmJV?=
 =?utf-8?B?UldXRlFiTURaMzFNTVByV0d6c1RhUWtncUcxK0hlT3d5OFF6SDRLYUh2eDZR?=
 =?utf-8?B?d29EQmgySkpvcHpGMnRCQ0plbE41eEhaaklSbzl4Q1ZNcWh5NXdQUzAwUnFO?=
 =?utf-8?B?RkhBQWtseXJtcEhMTlBOZFdVWFoySGs0cEtYUUdXM01JMmlSU0hoWmVFbTQ1?=
 =?utf-8?B?RmxzV1VXUjZ0ZXF0d3RIWHlyMlRjRnRYajNkRFNBOEd4eFN2Mm1RSllYcXk4?=
 =?utf-8?B?czZqTXVDVkNGbFJrUkZPZDFVMEpKV0NuelcyUTlhV21jNFlYb2grYm4xbERB?=
 =?utf-8?B?a3VRdmd2MTQyenp1Z25lWnBuOHpmVm96ME9mY1crYjhKOG0xSmtaQU5tbktj?=
 =?utf-8?B?dzc0MHpGZVB2QlpGNGEwZTJ5cGFWRmZhblpqZitoMEZTditOZStDOFZPa2lQ?=
 =?utf-8?B?a2p0ZDlIRHg0NXJoVnlhRTArRjY1WENLbTRNRnNzK053UkdxWnluTDVyYWw2?=
 =?utf-8?B?WWZLWVlpUFFzMDRRUUVLak4ybnZLeUpaOUdNa0RxejRvSDNVNmROWitPTkNP?=
 =?utf-8?B?NDc0M3J6SFRKd3dPUFhrTWVmRFM1V3B2ZkpMaTZ3THlmQmI1TUJ4M1ZyeDVC?=
 =?utf-8?B?akh6Y0Nma3hmV0YxdVBzYW5UMlE1eWRuY3NnRkdzay9SaUtKRkhwYmNQdUtl?=
 =?utf-8?B?NnorSU9neWxRVXdkZE9OMDlxNDlaV0k4d2J3RC8zVUpWd1JIbXhSREhoZXQr?=
 =?utf-8?B?UlJEaWdHRFVUdkZFMXI2NUxQVDZkZDViMFRLKzIrYUFUT1k3RmcrZVJPaVAr?=
 =?utf-8?B?bzFHeGNtWGlqMmg4OHErWjZyT1ZLcTZ2RVZOdHRCenpWbXZ2TU1UTytvZ1JP?=
 =?utf-8?B?NlZhN0pGUXlwOFMxS0daRVhCV1p6TGxnZDF2QVdnK1dsbHNaZHMxOFF0VWhl?=
 =?utf-8?B?eDdnQUV1WU1odm4rc0UzZHVuQmRoNnBuMjIvM0hWOUFSREdyTFlVclQwSXV6?=
 =?utf-8?B?T0JtUDVPaG00Tkp5TnNOeTVkK3ZBUDFGY3I0L3duc3kvWlU0UnU2NkVFY1Qx?=
 =?utf-8?B?elNYb2ljR2xwQ1lNNEsybTRhdEs2aktuMzNUdXpaZm9HZjFXa3g0TTloU1Zs?=
 =?utf-8?B?czY3YzFidU1Gems5enNXYVFqYjFGNTh2M2RIeWY0WHlPQUtYeFpHQjdUU1hV?=
 =?utf-8?B?SkdSOUNEbUEwWm9GakdHdFVUTFhLcFl2Q0kxRXRKc0EvaWhYZWJOYitmTkRn?=
 =?utf-8?B?UHNPeHV1bWp2QnE4K2IvQ1JyVWlaUHViMGVoM1Y1VWdkTGpHN3VKVmZHSVQ4?=
 =?utf-8?B?YkpLRFVKalYvSG1rcFNRQ3JCMm9LbzBjR2ZZWUJoZjIyTzJobWRRczUxbkhJ?=
 =?utf-8?B?U2NQSVR6TGxwNlJCVjVvc29leTRzSHliN0M5cGlOV042L0k3U0ljMXBpVm5G?=
 =?utf-8?B?VTRaK1hmQmpnbDQ2T2tBZk0wZzhuSWJzbzZEQkIzWTZZS2hudXYxUHFlREpo?=
 =?utf-8?B?M3FWK3RrUlJhZmo2Mkh2OXFlb3RLdzM2SWVBR2JiRXB1K2N6Unk2U3ltU2d4?=
 =?utf-8?B?cUExL3V3Z29qL241N1F5ZUJSeHFuVWZWa3BZNDdPSUM0MFJoNmx4VHN5RldO?=
 =?utf-8?B?VDJOTFIzUkpWS001cm9pbFNNazJsaFZST004WmlqQ2crOXJCaEZmOC9OL1NR?=
 =?utf-8?B?eVBWdFcwUTVwTmNNVlBOUTRZamNRWU5uQVV2MjRib0JkNXZTOTVEZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4099a0e-f112-4bbb-e197-08dec7363c91
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 21:21:29.3753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5VpPt+QMf3VhOfTwAKZomaeC5teojx+u34SJ7U/+4MG0stgM4p2mnC7zSkIQeiok70Tp+3eJEDfo5c5xIy963A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8209

On 6/10/26 11:59 AM, Timur Tabi wrote:
> On Wed, 2026-06-10 at 13:19 -0500, Timur Tabi wrote:
>> Yeah, I just noticed yesterday that the symlinks() command in my script is broken.  It needs a
>> symlink for gsp_bootloader.tlv.
>>
>> I'll fix it soon and force-push an update to the git repo.
> 
> Ok, it should be fixed now:

Yes, all better now:

<redforge> ktest $ ./tests/nova_basic_tests.py 
PCIe Probe: PASS: Chipset info: all 3 GPUs OK
  ok   0000:c1:00.0: NVIDIA (Chipset: TU117, Architecture: Turing, Revision: a.1)
  ok   0000:c2:00.0: NVIDIA (Chipset: GB202, Architecture: BlackwellGB20x, Revision: a.1)
  ok   0000:01:00.0: NVIDIA (Chipset: GA104, Architecture: Ampere, Revision: a.1)

Get GPU Name: PASS: GPU name: all 3 GPUs OK
  ok   0000:c1:00.0: NVIDIA T400 4GB
  ok   0000:c2:00.0: NVIDIA RTX PRO 6000 Blackwell Max-Q Workstation Edition
  ok   0000:01:00.0: NVIDIA RTX A4000


But a follow-up: do you have a quick "undo" command for this? If
not, that's OK, because it's only needed between now and when this
series gets merged, but at the moment I have to bounce back and
forth between reviewing this, and other things that do *not* yet
use TLV.

Just a minor convenience, nothing to waste any real time on of course.

> 
> # ls -l /lib/firmware/nvidia/tu117/gsp/
> total 108
> -rw-rw-r-- 1 ttabi admin 59064 Jun 10 18:48 booter_load.tlv
> -rw-rw-r-- 1 ttabi admin 39096 Jun 10 18:48 booter_unload.tlv
> lrwxrwxrwx 1 ttabi admin    34 Jun 10 18:48 gen_bootloader.tlv -> ../../tu102/gsp/gen_bootloader.tlv
> lrwxrwxrwx 1 ttabi admin    23 Jun 10 18:48 gsp.bin -> ../../tu102/gsp/gsp.bin
> -rw-rw-r-- 1 ttabi admin  4152 Jun 10 18:48 gsp.tlv
> lrwxrwxrwx 1 ttabi admin    34 Jun 10 18:48 gsp_bootloader.tlv -> ../../tu102/gsp/gsp_bootloader.tlv
> 
> Since I did force-push, you will need to this to actually pull it:
> 
> git reset HEAD^
> git pull
> 
> For some reason, `git pull -f` doesn't overwrite local history.

Eh? "git pull -r" works here, even for force-pushed histories, as it
usually does, no need to invent any new steps:

<blueforge> linux-firmware-nova (main)$ git pull -r
remote: Enumerating objects: 3, done.
remote: Total 3 (delta 0), reused 0 (delta 0), pack-reused 3 (from 1)
Unpacking objects: 100% (3/3), 66.03 MiB | 19.29 MiB/s, done.
From https://github.com/ttabi/linux-firmware-nova
 + c2931d3...60f69ef main       -> origin/main  (forced update)
Successfully rebased and updated refs/heads/main.

<blueforge> linux-firmware-nova (main)$ g
60f69eff16b7 nvidia: add v570.144 TLV tarball <Timur Tabi> (Wed, 10 Jun 2026)
1d3cbf7723eb Add README.md LICENCE.nvidia <Timur Tabi> (Fri, 15 May 2026)

And with that, it is all working.

thanks,
-- 
John Hubbard

