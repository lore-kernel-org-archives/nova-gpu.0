Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011007.outbound.protection.outlook.com [40.93.194.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80873360ECA
	for <nova-gpu@lists.linux.dev>; Mon, 24 Aug 2026 02:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787539486; cv=fail; b=aBGOQABMqaYFJC+M5aBKtMIMkuT8YBY6gpcz0J7KIWq9D3bTxWqAHdiBwFCO8fqflqqlR5o86r/1lAnz4wEjxTkIk3wSISaeY1PAlXCx4wmew7XadDnUi7lsZqQBDoB1gMNIVTkuA0gELfIdAN/6aP5qUApRHG036cf3drclMCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787539486; c=relaxed/simple;
	bh=MRDyqqDBVVqsJsXtUtSR7FycCAR88v7tG+UkuTj1GfM=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=IcPsAsLHMX0XgIi15rKGJXVxVBWY0Ti+XR3fK2coGCBYOrV+gF8dyjasMIiLsIAn7SsJ/Q1yeKraS8oOi8ngdtMUdamM/1dStsSd1/H4nOk/bHQJ4hDsyAOc1UWRBLzVZFYW2crobvXxQjlGZCrbFGZsj3GCwTO6+WuRiXykWIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jtTAzjFl; arc=fail smtp.client-ip=40.93.194.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jtTAzjFl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zEqQABKXcPIShtHMosIyCFO9XAs5FXGewxAZsJ4umgAOxP0ftiwrKHNlozNqRf6wxHQqbydUDjZYiqGlZGz1Sg2l5yhlIi10fAkwZNiCsF8vIQVQuymgsCmWyRFpvywq516EWXn6VmJ8tF6boJmI+8QK/e8MXjRyom226L1SUM6tqfmpa+gMyojWRd4h8j01mJmyTh7p2Al7TyMeY8LlsPAjPoZ2xuBik5Y6d2QtcVPLbT6D5QOVbiTG1llyLgV3ZRRU2spUQ5o/fMONqbnLYX0EHcDpJFQ8zqFX39ka5bRAmT+7JHW57GwIqGUSMTFrQ/5xQTLYoR9lKxkyuzdrTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Rin2oxacPr2ZbKzKm8RTThqENtkRYYwAS3wjpe3tVM=;
 b=gDteq6DOeybGI7XkvXL931cSLjoS3q2lR117DQLYcU2B3YUH19IWC0gna0Sa36IuM3Af5Scg0yi578bDzAkdagm2qzLKzJkSSjCopFoxaaF0RqN4t8ZX6SL9PAkc4TEWtmTHbxTtPObbKWeY39/b/D8O68ojXjahWCDZO5iHHt7/6UZLv86q/O/rvETa+NKdCWGJR5H0mCMp2s6f1ji/xOBTChxsuoESzUOjFldhMZ5+M9ncIplfs53N527cE0X+h4D4UfzPToYXGCiIxAP31UgvkXfAYxJq7SYZw6OsL6qE3ssv+Rf01o452zwwv0eeyRyTzoGf1zDZTsYZDNqxdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Rin2oxacPr2ZbKzKm8RTThqENtkRYYwAS3wjpe3tVM=;
 b=jtTAzjFliGDfgfcRJOf+5sKSeRTyYeyw3B7UN5C5tFLr9Ymj/tTSv290/jo3ux/UjcH3dwa/vT7flbAJaJbSMtjf8pUpcGVQQcWPvcZIJ3Z8EajpasB5+/ZxnEoPpHML2XsxxNek76+7yi6oU6F6ozbyHSuNJuGPobRRi9xQy2fm3pVGE3YLYLkwMl4SUVpgNbcnELsfEjz8YaAXGw5n7hkt+PaHZbWLKK0Q48KPgMp5vMEU+ZEpQyM6l2TchmkLrdCrwNpJqstcm0qToWAnaRjeT/tFVzIgvbN9JoOf9ETwLInGJ4dE7Id3iaHzn1URD1/MtBy3SuFRUMnQBiiI5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by MN0PR12MB5811.namprd12.prod.outlook.com (2603:10b6:208:377::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 02:44:40 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0315.014; Mon, 24 Aug 2026
 02:44:40 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>, nova-gpu@lists.linux.dev, Timur Tabi <ttabi@nvidia.com>
In-Reply-To: <20260810181243.3036669-1-ttabi@nvidia.com>
References: <20260810181243.3036669-1-ttabi@nvidia.com>
Subject: Re: [PATCH] gpu: nova-core: write initial RPCs before booting GSP-RM
Message-Id: <178753923258.768430.14456476216173796572.b4-ty@b4>
Date: Mon, 24 Aug 2026 11:40:32 +0900
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY4P286CA0064.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371::13) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|MN0PR12MB5811:EE_
X-MS-Office365-Filtering-Correlation-Id: f5a15629-f37d-4491-5398-08df0189a4e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|10070799003|1800799024|376014|10067099003|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	PP03FzTJF20wKHjiq4b7kGr8/YopazZNAfVju2SfL4woBuBCqfgMprUMX6779hCDax5SPQsgqz1hdOMkKl9f1EF1AQCmTlZFBBfAxShzyrUmxnEEGY5njQQXl7smWWX8GxHmBiKHyjTdOfCnCGHsuXiDFJgFoSY9WLnXe5Ep3/JTFt2GpcaFCDFvYitr3Eg3sAtwZWHKTRPhhlTqzqsY9uZ4pAG/tMWkdZxcX+T3v+ZMAF/QSGn68oNUgxHToRUeaSrZCPL9p4GX5hFiuj1kG8RAPZI2mp0C+dwrxQEkxbpws5Uuv7lfqvb3PeAHlI3johdauJrb43dnkCMMYqbOIJ8MJFvc8MydUfwU6rLgBaok/fOHsFcij5O5JOu4ImlE00JFyHQM6ln+H1lMpPeVSTDee4Wtb2YyxCw4uYzmKkGDgUnOX4zzBlETd/zVtTzgEFL43pDHwkVmoh8UUmdayLzcDub5824oBETV5aZpNuqc6ZLkAOdCghr97qjbcTXySuP9nWhHs0X1/re0hZkU1vc+hZ/sRh95YGwkWm/y5DYtrIeUFEPqQf86LHuYK39eZjSV+hxhnoZF+7iMdW/Jok0N3zrprlVJF/87COUI5uELECLpb8aiOk0FXeoYo93ksfyA8962Q1svjM5iiaGgOC54/3FgvNgcFujrBOl0oZE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(10070799003)(1800799024)(376014)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M25tdzJoVy94c2k4aXZMT3JRcVV3UW95MXUzaHNJdlpSUGV1Z09kWk5SWG80?=
 =?utf-8?B?TjFOVk5KQVlHNEtUZlI0OUExMmZTU0tXUm05WFdUUjZ3UGlKWFJWSStnZmJ5?=
 =?utf-8?B?UnJvNXZ0aGJKMkdsVXlmT2RDN0EwQzllRU9XV1hCeDRzUGpzUG5QbEZtdXJm?=
 =?utf-8?B?cmR0N2RDaWhQSVBRQ2VMRVZHcmtBWGlIZ2MxVU1TMEJvNU96TEhwNGU3NHUz?=
 =?utf-8?B?eHVaQ0tjNjJVL3lYTDI0aVJWWllmVzdqSWc4K3lzWnd2SVNRUytQSUdDdTVD?=
 =?utf-8?B?K0VVRUZ1bEZJSktwOE1sWjlMenRzVDZUempEdmQyVzRVbmZlNkVjSWJnK2Ro?=
 =?utf-8?B?cTNsYVVtRnhhMU1MSnNtTmV2RzdsRnJkWGZIdktvY2NrY3g2eGMrZWx5K3dr?=
 =?utf-8?B?S2pZbGNyNU1vZjZrRHRndENyeVhiT3BLbjFGZm0yMWk2NzhnNExHenlORERM?=
 =?utf-8?B?RW5JMmVNYm1vR2VNR21BRHhNUWtxNnRaZFRJZklVUTJqdUxCaE5Ga0t6bVVn?=
 =?utf-8?B?NFhWR2twVnJFSHU5a3NZMWtzcWFWR3dVNGx2NSs3dnpISGNGOHd0L0dWZ3ZL?=
 =?utf-8?B?ZjI2dGtKRjBaRkRPTDFSSWZ5WFZUQjRzZUZCQlN6ZnlMaDJwUXNJVDZFRU5z?=
 =?utf-8?B?RGpRVTBFYWUxbzVuUThsSHdTb090MUZHZkJJSzQ5OEU0UXZQSUxaZnRrRGkz?=
 =?utf-8?B?UGxqeGFZVjJxQ3hQaExYWjhuQS9XNklQUXQ3VnZvMFJ3UGp6MWE3NWtPdDdx?=
 =?utf-8?B?dzhkcDhXdi9aeUxhdCtEd2MyRTByU3dBaWlnd1pITU9IQlBtdzJJQS9QVDNU?=
 =?utf-8?B?UzFHQUxPSGRZYlRIemZ2RnFkYVpTYXhQVEZhWjlqd1RiRkdMUk5JVHRhZW9B?=
 =?utf-8?B?eFFRYnlWZGhjM1dPalIyS2lVcjBzQlRFYTNVQTM5Q2V6NkwrYnFJcElhbFZT?=
 =?utf-8?B?UmZvenltSXpPeHByQ2VBOU5hUmdHRlBJQUhJRTdTUGxCQlN3OU0xRTBmM3hG?=
 =?utf-8?B?VDl5bG9LTS9DemZVWDdzeFBLYXQwalc1dXpZSVRFdVUrTnU1UUpGYThtb0tt?=
 =?utf-8?B?eFdlMWRiVUZEODErVTNsb0JzdWtLZENDNDdXTHZvMDcwRnI2dUtCTWhMb1lh?=
 =?utf-8?B?eFZCMUV4NkszejNCTWMyWWp2WlNYQ1VqVmlEQnlwSHpxNzBQVGZiUFZuOUZu?=
 =?utf-8?B?b0R3TTlvVW5BRjBJa2tlTnVHdXhLbCt1b3VXMVdJRUdzMngwOG50c2JDZGdl?=
 =?utf-8?B?dzVrbnlyU2ZSY2RDNVFJTTE5R0ZNR2Y3ZExLN2prYU9QUUdHQVpVWUxNd3VR?=
 =?utf-8?B?NHhHeG4wbDdBREJiQStBcmVPQ1I0Y0V6UVhSSHQxMThBZ1UrUWpSblpKVWs4?=
 =?utf-8?B?MjYzekRmSm4wODZHVEhEUXZCbklZRmhQaitqU0EvMU4xL0VpTVlGQ1JOdDNo?=
 =?utf-8?B?TjhMN3Y0ZCtoYU43U0N3WFoxcDBMWUtNTUdndGRvVVduSmJ6Nm4vTmpnMEFY?=
 =?utf-8?B?T0xkS0pJdzJKOVk3VzFSc1FxbEp5ekgyT3p6NUpPYTlqRmwxZ3J3bWwwVUZy?=
 =?utf-8?B?YVg3SUEyYWQ1UU4xWnBQS1NBU2I1WTd2eXl6MFEwSWk4Vjd1WmxTVnN4MXBu?=
 =?utf-8?B?RG1mVXc3YjRKejlncEdGNDIvZjg5dldtMC9uak1jUjg4R21NWW5YZllNTnVX?=
 =?utf-8?B?ZXV4QTFuQTdLelp6K2Z4QjUwQS8yQWU0cmN3SHdEVU1Wbmd5K0tocllCSzNZ?=
 =?utf-8?B?RGJVZGFPOU1oOEo5VjA4UGlJcmZJb2RRZHlBRkRWYmpEYS92bHpEanJETjUy?=
 =?utf-8?B?ZUVmN2RQMlVuMzJhSjJQWnlHcnY5NG05TGRCSlh4aHdadDRvUXVLb3lNb2F0?=
 =?utf-8?B?Ynladlp4UEM5TXo1S0lHcGxHajZCSHBUaEw5TDZFNnRRSnU5UVFjbldldk1U?=
 =?utf-8?B?ZXd1bzZPQ1kyMVZ0am15MkNaTmpsU1lXb0J2SXBhLzUwc1Fva3hyUVA4Vlpo?=
 =?utf-8?B?a0xtWFBUbnpZb2ZFVUlFN3ErcllNWE5BYTc3R2lncE02Q29BN1VkcXVGOGdw?=
 =?utf-8?B?Z2ZYbnhHVTlZWFl3a3lRSFZrRVl6TUhKQm5Ud2VWMkVCYmpUTm5pNldJam84?=
 =?utf-8?B?bkpIbTZwQnBRRXBvQnFvSmFzaFZPeVV0dnU0aUEydTVEU1oyOExHVWdMMmhP?=
 =?utf-8?B?YVRldDVqbllaVlVWc0hXNStaUjlHWUluMm51ZHBxU2ROb25ZTEFIcm84OTQy?=
 =?utf-8?B?K21zQjlQdVVvTUJlbDc3VE9oMzJoV1BLeHdlRE5KMEsvMVlYazBSbjNzM1Bz?=
 =?utf-8?B?TEovM01UOFhDTkhRYy80a0FSQXJQRHVuV0JsUXVLNFdTSytzbjduRmNJOThQ?=
 =?utf-8?Q?t3YfY80HMRWa/SDfQXSANwffOCXjAwBitvqW8uf4nKOYu?=
X-MS-Exchange-AntiSpam-MessageData-1: 19Q4DixhtOr7bg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5a15629-f37d-4491-5398-08df0189a4e4
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 02:44:39.9904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lkwF8giRDZSaFAfRfLSD25vbBvuTXUG0YD2sKTjjkRmtvY64iMKbmvTE5CZkGY5sO6n4OljNpLMUW2aFsfaeBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5811

On Mon, 10 Aug 2026 13:12:43 -0500, Timur Tabi wrote:
> Make sure that the two setup RPCs, SetSystemInfo and SetRegistry, are in
> the command queue before booting GSP-RM.  These message are expected to
> already be present, because GSP-RM will process the queue early in boot
> but will silently ignore the error if absent.  GSP-RM then continues
> booting, but since the registry is not set up, it fails to initialize.
> 
> 
> [...]

Applied to drm-rust-next, thanks!

[1/1] gpu: nova-core: write initial RPCs before booting GSP-RM
      commit: 6556f7556d622dbbc5c936df9d39c2f33600adfb
