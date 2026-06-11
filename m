Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011019.outbound.protection.outlook.com [52.101.52.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206242DCF55
	for <nova-gpu@lists.linux.dev>; Thu, 11 Jun 2026 19:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781205368; cv=fail; b=GZ4X/V3wOvmjoafJDb4sGkfE7tM8P+dsbzh4kxqWwSx6jBQ4VTUoGrryk0kRKDkm/zPBinc3McZrAN3/hEPq78zg0KVjVzGck4hlU3YCnLtihskIFuhr70vNP0AOq1ctle8E2XoacBYGgVtinyO9cYX4gWyBUR1D2Qq0RgDyE1c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781205368; c=relaxed/simple;
	bh=c0cj19sVOgqgS1MAB93rMJGBM3YxDpZ9pbdxbbQnHJ4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=H/7yE7YXYVfADD1ZRsqhc9u2l0en2hfllqXth/dMgVaqKLqUQY33gyqX0dHTfkVOibLfRSgvSHACh82Baj1mxUPpesiPpp8iA3Pir2lZ3c+nzCHz30dbkzyhw888Lxpeq3aKjUTKmMEn470/To/d35fuPjXOA+3VEjqErX73R3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ct43NsFY; arc=fail smtp.client-ip=52.101.52.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ct43NsFY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QJ1cYi/OCiUKQR47lKqt31eAP+DlY6Eg+3PPkHQzUtJijm1Px0ft6UNNCUF3juRFo/tLF/EWXl1sso20PAMysVmQnJGsAMH8lnF8fA93NXNcejpHsuMumDze8k8xCqKyRhJ4ylkfyvfkhzjuuccH8tKQT94nGmnxf2OWZmcv4EXrkukoZ8xkDpj2+Os/gHuSt2Rl9MAFdrQHwXlfRTjijI+ZHetsnQZO0i5A3y9zTtIAScCyNst8Jru41jp9gMe45b8itwCWcMtapEH8PDoMjwYtA0Y+AlYPsv5DWUVCUopzepZdwoGDF+ksDrXaUVlOM+tdllxdEK3bAVfol208+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dCPh/iAipDCcks50pM8zmm9mqj+ikMtH5y19rnTIb9g=;
 b=KSEsj8Y+5JSJ9in3sI5OEI8K8JvPcY3EHTh5kOyXPmoJCDz+kxkb0FqmIdKsbSWWlKZgB6JAruxlbUwreG8CM/SKj+i1TxP9VjXi6VsQ4aIV0cwzhPHtetxdBT09MC1u3FhBaRDZACK8Z0aFOk37gYlyJX8A45xdOsFOetS5nDMBw9VYbHm2VCtFQcRchcSaGUty/sFkSZav5Q0uzDmffmHANlUGibh7WgHxF5q1QQtLu9tScqjiiUUh4mnMtvjKdxgTlYoaaZlfy/8LZM+lyuw0O60c1bg8FyBta7oTD71ZmMrDJoEe8kRYA72RFlUXKgD4xC2fJ71rk/JMyaQtuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dCPh/iAipDCcks50pM8zmm9mqj+ikMtH5y19rnTIb9g=;
 b=ct43NsFY3WrdJp0qECVwAcK7Qe0nRlH1tx8xz6K6j/d8KtfH5WNlT/oVpqreeEnPnDty8wQiVTRF1+IzhZ3gzGhkZDwl45xFLey/PSIHW2AJ0qGFCFvhuPsDEx0tXXhiYk5dtk86E+AZpR10g0nt+C4hA6/shSFYsg5cIW4dtmwX5RtOw3AOCxbaDI0cipC3Ew/XIefQYOj6sf9l862k7m//oshn6tFO4g4MA2cKp4bUZFhkjfBybO9xtubCNVGdeyHFF9JyFFS1SZ+FVwARB//KdQZU0ieQPtmNlT73Np8ri9OPezXwKlft/i5n96SFyY+PMhIZPMlRq/MI15PLqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH8PR12MB7134.namprd12.prod.outlook.com (2603:10b6:510:22d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.18; Thu, 11 Jun
 2026 19:16:03 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 19:16:03 +0000
Message-ID: <c00f8539-d69e-4d47-afcc-457da53c22c9@nvidia.com>
Date: Thu, 11 Jun 2026 12:16:01 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] gpu: nova-core: add request_tlv to load TLV images
To: Timur Tabi <ttabi@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>,
 "dakr@kernel.org" <dakr@kernel.org>
Cc: "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>,
 Alexandre Courbot <acourbot@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>
References: <20260610174929.744477-1-ttabi@nvidia.com>
 <20260610174929.744477-3-ttabi@nvidia.com>
 <DJ5PH7GLXQMC.3MB95TLS6T86D@kernel.org>
 <769e0e91a8715e3665545a22decd3eb8cb111ddb.camel@nvidia.com>
 <DJ6FCXEV1XRQ.1761U4FX665Q8@garyguo.net>
 <f55c43fc4cff816a0d10185d17f761051b879ac7.camel@nvidia.com>
 <DJ6FVVHX14V8.2PE4DOU69H0G3@garyguo.net>
 <39c34add0996890c934fae2cbc3e8b96e94c3fd2.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <39c34add0996890c934fae2cbc3e8b96e94c3fd2.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0199.namprd05.prod.outlook.com
 (2603:10b6:a03:330::24) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH8PR12MB7134:EE_
X-MS-Office365-Filtering-Correlation-Id: e55eb4e3-a55a-4ecf-a2f7-08dec7ede10a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|5023799004|11063799006|18002099003|22082099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	d2FtnwL2YJV1qDgCuEVarCB7qLliZDcX+7q8xJZ62vPi9XmCztZxykvdF9c5UP8uCUvT5A4lnLztORTnfjnF1P7CnaSAUmHtsnNdy9m+8gXRPDPccAb/0up65uX8qifGP+3W4s37LhCwRmPCUH6fi/V2HUcfxgKI8xd/MKU/L1ophC71MhQdqYcxcd4HRxxax4jhlTVwQAdokHg/8mAu8SR6Gft9GzgvMvDA2xUYVCPPfXJBt67SKFbJe8vhrf3Aa02yOnDBY8vWhmM8Xhff1B/uujkAEDj/lidpz2TTw6GaxE0ngLFPt38chhZQkV+vGRK4xQiiFPSbcSjE5zWZbJPftHGxciEWd3M0TSfSKkDaURNN6zTT9pWjNjNxhdaSsoPAAvTLfnAxbcK6VacpMALCgkeFhb6DqTPAwEQq+7uNuRQxdXtXCcqtedum9koFswJYDt/ve/kvdMbnCi6RwKzoUbj/wBisdnhA/eb9ncmG6Y8E2TJmtt9fDftwzehN1tdGChhKhz4VLy2mQecuRbwAZ37T5STQoSptlhrvaWlM1dQ9qif5aLvlsNat393U42hXLkEyA1kLRVoqknhdhU8eht6Ae192PSMXiDGjf1MsiNmKTVnSj8M3Ugeg1tTBIAnvVgnN6hvdt7TXrOcoKWIJvYBkIGyUm03y9UNFl/Il/Vy75tyCef6MnbN3u6jm
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(5023799004)(11063799006)(18002099003)(22082099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFJFRnY0L0NxSklnditsbTFsR056aVdZTjFDT1Z6ZmdWTHZLQkVhVUJpS3cr?=
 =?utf-8?B?UUVOdUJZcjNyeGxHRWg2UnZndVZzMkRCQ3dNTUExM3hFSWR2UUJyd29tZXNu?=
 =?utf-8?B?elovVUFXMFFmem9rdzE5OEJSQ2dIT29mU01tTDRqMFlrcnluRnFaRmxKa2tt?=
 =?utf-8?B?WU5KZk5FblpEU2xtU0ozVFB4bEkrcy8xNDN4L3JFeFAvNFk3V2gwWWM1Wldp?=
 =?utf-8?B?TEZQQWtTZ1J6bjV5SG4wUHpwL3RITlpXbHVycmJRSXFvcWxWcTZReXJ1c3dY?=
 =?utf-8?B?R2pYM3dFSVFEZFdVMDhxS0JFZnNqM282NE9jbEtMTVFNTmgvbWNvVmtZdHBx?=
 =?utf-8?B?ZWp1bmVvTTgrODRKM2RpbEJNYkhxS0NzQTZBTTN1RFFKY3BqUlgwaktMRktt?=
 =?utf-8?B?S2dWSk1rRVo2UVhTZjNRaFpXaHllN2lvdnVodGJ4VzdraFQ5andQbjJOUllw?=
 =?utf-8?B?bkRZMldZKzhZZDg1WjNRYko2RlgxamJROExuL1B4d1kwTW5MTTQwNElGN0hr?=
 =?utf-8?B?QzJ1cThKeWtDaE9GTzl0QmJuWGVlL2xmL3ZQcEE4R2h6TUFUOXh1RDk2OTFS?=
 =?utf-8?B?dlBzY0xvTWF1QWFiQTY2VlVsUlppdWV3MjNLcjN6K2d6Sk8zcEZGdXNyRVpp?=
 =?utf-8?B?elRSUmx0UlcxUTBMYWg2NVRlSDVSYWZ2bHpTaU11S0VWaHZJVDR0WUlGampq?=
 =?utf-8?B?QTY0c2Urc1BxR3drakRIMGVNY1RhV3NGRlZYc1hkeTNuTFZCVXlVeUlwcDBW?=
 =?utf-8?B?ZU1sWmlVVERBeXJ3WkswdVc1dUxLNjhVV2Urc2Y2YVkramtHZGRzUlB0emRU?=
 =?utf-8?B?NWdrb0JYd3VnMElOckhLdmRMMXc1eXh1WEVSTGlReU4wQkJUYmJ2c3Y4cndM?=
 =?utf-8?B?RlF2NDU4emdLWFdMNVlEdmZKWmt4RTl1Q2Q4UURNVlQ1RGsvemVFeXArdUc1?=
 =?utf-8?B?d2NHQ0E2QTdHV3BPTXVUYzJyZVNUUnJveWtKM3pydmlCWEJPWkdBanF1dkF6?=
 =?utf-8?B?NFp6anA0KzhNT0lmcjJSeUFtQTZKejZBMkRmbUkyR0M4dVdOMDJocHJWbU0x?=
 =?utf-8?B?Vnk4NWdoRlJHV3BVQVNYYW82N0dKK1VkOGRac3R0QWQ2T2UrVmRGRW9QZlVE?=
 =?utf-8?B?WFQ3YkdTcTFOQW5YbDc5MTFWVGxQM1JUcG10VHdPalZkVDlxb2ZvNmxPZGkw?=
 =?utf-8?B?bU5kVlVtdkZqNUxNSG1LZmNTYlI2Y2pJVlo2U0Q4SkpVTDNpUXQyWVE5cnp2?=
 =?utf-8?B?Q1paWk45Y3RRWkpkRUhUMC9sc1E0bWFERVZWNHlHMDlTOE5PMDBXQTA0S0dX?=
 =?utf-8?B?SWcvZFZlRUtCMGNpT0pxcEVndEhMTkdESS9OSENnRzNEbUtBbG4rMUg2WnU3?=
 =?utf-8?B?ejRJeEx2YUxGVll0aStHSUFHWEJTSUZualc3dUdjVE9wSUlxZXY0V01HbUdC?=
 =?utf-8?B?eHJSUkp0OG1qQWQrS0VuOG9reTh3WjE4dHQ5c1A1OTJnYlpRNEorUmtTdjFX?=
 =?utf-8?B?V0YzVGplVFhiWDFiRDgwKzRhcnp0SFhTNEkwdjllZVpXWlRROHRlTFRtVm9K?=
 =?utf-8?B?azFJdnlFTkpzK3hPeTFySmQ1QUhYc0wwc2kzL3oyMHk1TVJEUnAzamdyRzlD?=
 =?utf-8?B?T2xsSVNWbzN6L2lXalFHSnYyUVlxT0JVeVdyTXNoMnNmV1IvY3F1Z2M2K2lF?=
 =?utf-8?B?d3dCaTFHb3NmKytxeFpWbkE0Rm1Ebzkzc3AzazlpVzVPemZVMDBQTFVCTUkz?=
 =?utf-8?B?bHJzNEthd0IyQXkrUU5FK1dMbWFLKzFCTG1HK0c1VkxYL0E3S3hjQkRNVGZx?=
 =?utf-8?B?R1gzamFqS2lGYnA4K2NNaGtvejlhRXNEQnIwbFhvNE4yd3BPcnlCR1FFazBw?=
 =?utf-8?B?Wlp2L3J4a3ZhNzZVcU5yRTFmNmkxZzVsQzBiQjMzNmplL1c3aTh0RlVWaDZy?=
 =?utf-8?B?VktwNGpjcU5WRTlpL0R5UFlsUGE2eXpBVU9EMElGQ1M0NUxOZFZCYjRON0M0?=
 =?utf-8?B?ejQyanZzdlBZSjFyd1M5SFZjSitDMFVZOEhKQWtHQ2dCTmdoTjlWYXBMYmht?=
 =?utf-8?B?cGVJSzMwaGRGTSsyVmZFOWlhRytUUkM5dkgvNTR0T1NEUG80MTNJRGcwaWsy?=
 =?utf-8?B?M3dBc1FKN2F0S1U3MkpVSTJ5aFVjR1h3KzdaU0hrL21GaWF0dytBSldlaXln?=
 =?utf-8?B?TVY1dkJGaWZObkFUbmhYOU53UVh1engvc3d0MnZuM1JpZmpoOXg2L1MrMGEz?=
 =?utf-8?B?Q3RaTkFtcDN5RlhSbWlmQjRCY3FmaE5pL3pvSElLSHBMd2lhaVF4SWF0d210?=
 =?utf-8?B?Ump1VlJmaTdRVHAvNXA3SndZenYvTkpobFRIUTJKT25IMDAyNzRBUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e55eb4e3-a55a-4ecf-a2f7-08dec7ede10a
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 19:16:03.1490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dJtWs2MQCT8WHz+ekqw810A0eHSaonJD7bvK0r2RYxea5OMeqPnfRjGZAilYdnZ4ViJ+qMpIpL3/ZgdO4IXPbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7134

On 6/11/26 11:53 AM, Timur Tabi wrote:
> On Thu, 2026-06-11 at 19:42 +0100, Gary Guo wrote:
>>> To me, the whole point behind allow(unused) is so that I don't need to remove it right away
>>> when
>>> the last user is deleted.  Or conversely, (which is what I'm doing in this case), allow me
>>> to
>>> add the function without any callers in one patch, and then add the callers in a subsequent
>>> patch.  Then, after all the callers have been added, I can remove the allow(unused) cleanly.
>>
>> What prevent you from forgetting to remove the `allow(unused)`?
> 
> Common sense?  
> 
> I can understand if I wrote a patch set that only added request_tlv() without any users, with
> the expectation that the users would come in some other patch set.
> 
> But this is all in the same patch set, and it's supposed to be applied together.  The only
> reason I added allow(unused) at all is in case someone in the future wants to git-bisect and
> they land in the middle of my series by coincidence.  It serves no purpose otherwise.
> 

The series should be git-bisect-friendly, of course.

We've learned that expect(dead_code) is the way to go for this sort of
thing. allow is much worse, because it is too easy for it to linger
(just as here!) when it's not needed.

thanks,
-- 
John Hubbard

