Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010041.outbound.protection.outlook.com [52.101.56.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742973603FE
	for <nova-gpu@lists.linux.dev>; Wed,  3 Jun 2026 01:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780450456; cv=fail; b=cJppdReZ/cGq0TRBjg5HdBu8V1w0G1pVroAKwXd/oDM3/OHWP2keJAO5a/JYLORVKw54+HiwvUKn2fvzgaHIh069EEC02R++jRvlMMEOAUi1fbySuLxsQOmKQnqMJDY2QXE4VOOcB9rcjxzQINuWSC44Pn8sJ5cZrDNepdsHBzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780450456; c=relaxed/simple;
	bh=7bn4dKntu8/jT8vSV/7RaCtEGw6OlvUGlG7dEsnahOE=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=sMPDHBihaz7gMjn6h/nBXVaZmyijbJtXus57P586t2gTKJG1kZovR8dVrsDwDFd/419zVB6NO4VUEbgQjRLL8KvaT6p+4/svukgl48usr9yTm9ERVhHSbMUTl1O2BW/bc8iUVdg1Y5/tux+3Rw2SNjhUQWm5Xts7IV7oEI8xEmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=c6/BOyd8; arc=fail smtp.client-ip=52.101.56.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="c6/BOyd8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mh3QhuKpoOSzjrRrIzQjSKdwMVTmIJ9EC4olwwiJl8ZSGVhsbZEP6OdMPvNXqNL1pJk/MoPxGCtorHiKAxAAxQJP2+UEf2XgOZX49bQZK8oQlMFXp3CuyWG3Ug7ruQca8nxYZ2UqAXwLY5AcvT4RqJlx1CLKSgkngYo2za4A5mHZpHzgNChJvWieE2AC4sbFvBSc/PcLYHk7yxkVamxnjXRxNhOztyoM9aBxagvn+axi1kLsBeHEGT3Ef0YFu0EZ93tWWlgDw+AVpt899+EI9eNsWjLw0unCCv2FEF1c/Sl3X8hg/XyVCQKp1rK7e2aQHmU865sv+id3HAz9SYTmDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NjnS7btC4B8332IRr38KRZ1TEg+REHci8VsDUy1QCog=;
 b=F8T539PQFXqOBNMbl0+4chR16PKyTPojFbaGpZVjzplFC9kAqlT8kDbKFItb95dg7qOd1urPprSCwrVjnc3c2qZklt0KlP4oGAt5Py+pOOsAZVWPh5M9LAIFQelqS8EbAv58okm3cG1aBHn6Jhpby7i9mwH/iNyi7DB7FZu6zmb664oitKTEp34qchxgACsj8TWCH8a2PSJ/jcD2YYhH4V36pTF8+eME7ChICd0xRvl0wxFfJ9c+YNdDEaZTeOowsbQOdQEt3tISerYWYTzU8+SAxW6k2hPjfcH5hq0Egoied64kq5gbs5NMZ40LRmxAcLUHyCBEwOe1qYjFciXllw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NjnS7btC4B8332IRr38KRZ1TEg+REHci8VsDUy1QCog=;
 b=c6/BOyd8mwKsG27etI+rplBJDIMnZjf/VCaOqgXrCbbX8fVoqr9S7QMng19MrxgRdd9eMingfIppwdfofE5Ri2ywbc7Amyr39WF1WYgLNtkJr3GcGxKLX50VOad2D7co7kRng088heURNm5v0Q8MgNjrtxcGlV/WaCAsj1384jIE8EpVBxuYUV9CJgo9ba5iVwcmXhXNM2gzebFFjb2IHiGUzvEJRoJSMrED8MIKIiUPc/WiC0UwhIQq3IKUV3bzQld+CC35JDZdBvj4Al72lb9JeWL443UtBZEeIexFg1tgRzVkwUztEgi5DUD/pulpDnzXe/yyb+EQRRuOeMKyug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB6716.namprd12.prod.outlook.com (2603:10b6:806:270::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 01:34:09 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 01:34:09 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Jun 2026 10:34:05 +0900
Message-Id: <DIZ10B6ROZYX.JAM563H7Z5LX@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Shashank Sharma" <shashanks@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nova-gpu@lists.linux.dev>, "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v12 15/22] gpu: nova-core: Hopper/Blackwell: add FSP
 message infrastructure
References: <20260602032111.224790-1-jhubbard@nvidia.com>
 <20260602032111.224790-16-jhubbard@nvidia.com>
 <DIYK5AGFFHSP.3PVP7YX854KWN@nvidia.com>
In-Reply-To: <DIYK5AGFFHSP.3PVP7YX854KWN@nvidia.com>
X-ClientProxiedBy: TY4P301CA0059.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB6716:EE_
X-MS-Office365-Filtering-Correlation-Id: 05505326-84bd-4a9c-e04c-08dec110354e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|10070799003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	N2lqe2iLxTk2TWUTA+mDaR88DF7uYKRruMwW8xuIvHfcLiTJFcYBEEg5TLO000vErqVxBm82qjdokuBrXf4EH847ViDKncHVQq/n3A73bWgaep5cK3e6Vza+QOWpPElgTuSP0C2+pGJSyQXR+VDhkd82r6n7jQX1Lm7dt6BAInRwhrqPkmcUf6xolbzX8l7esHekUzQQMA93T9Jr/1EN4fTpLs+cf/8j1Y4RGsv9UO0zi+ZSPJOaXgJdEo76jrglKE/+He87fL0/wF4/SvmSW8qdLnE8MIOVgKDN1ntoP9ua6iQv/aBEflvmxTOADyEYBWkT2poLKogZseZP0cv4aMXMSJHQaJjH1125cYTjl42HS6DRnbv/KoYFbkShqZq0lPPdmX+vVaO20usuH82IT84tPEjgZbz6Z28FZ53dNy/AnLT2MdDK5zxejKA43Vwk5U59TT282yd6bqdrNSQ7+djbxgl/PETMmdDiCvvIJDEzSlHzf2RWyL9w8szvVZ2eOtoetlg5rD02pv8tl3UKCJzqbqZO3mwAGm7Hq5dBgqw8rvB6wgRmwBEbjf9cRmTDy79Y4NYNHjcl2iPMQH2GBf4bAIyULf/tl4wFsI1NppdUddT9W3ZPtYhxQNiANJ88xy+rnj/4PcPF4D7Ms8iNO60RSnA46W40h+eGUNMZXEd7loj2gbeRSlQV/+nmRRXl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGk5emlRYmJWQ0FYbTVlQ2lIOU1tRzNaN2VINWMxSmR2ZzlYVUxtZ0dtSGlH?=
 =?utf-8?B?YjNySDhsemhiZmgzbWJaREhsenpyR09hUHJ3NXRudG9Ga3BNVVFWY0pOZEtV?=
 =?utf-8?B?QkFBelp3TDFzWEJSeDFpK0NQNkNOcSthdk1oaGYwTGpYQXZHMTNDTXAyN0Jr?=
 =?utf-8?B?QlJRdkFGU2xyNVgyWXFKbWhtbHc0U25ncDBIWTd4cWh0TnU4VXY5WVVsMFhZ?=
 =?utf-8?B?U0s5QmJ5M1ZVbzJ3QTJkMk9zOGorOHFraDZqbXNhNTRZU1hTOCtaaUdaT2ZC?=
 =?utf-8?B?OVBGNWMyRlU1Tlk4aWdqQkl0cldCUGNkOG5BaVlqN0dSL1RVdU9pL0p3T00r?=
 =?utf-8?B?aFdnbmhYQkg1MDlrTlRFN2I0OVZObTVPY2ZDQ0pQS3hITkJGdWF4SkRqOXV2?=
 =?utf-8?B?eFFYeDNNU2VndUNsY2cvcjFMT1pmaVNBVDdzZTl1WFZva21scDRydDlzcjQ2?=
 =?utf-8?B?OHNaV3o5RmtXN0ZjRjR3Q2N1RFg5c1pZa0Rqamk5Z3p5YThOeER1ckxwQld2?=
 =?utf-8?B?ZGtleHBFUWpnc1BFMVgwK0lGL0NZL0hXWHFVS3BSQWtzNmlkUW1sTzNGeWRB?=
 =?utf-8?B?NkdUWTd4K0J4UWpGMDVadW1UczN0M3Y1cUhDZE9ZQUdiZFN3aE5ISzhudExH?=
 =?utf-8?B?bUNVWnJHdEwwVDRMRTc3MWhWRGdodVFDOTk2NlJsRnMweGdQWjFNZVVqWE91?=
 =?utf-8?B?dmpGSWZRY0xkZ2l4YXVWNjFtckYxM1pRbjdEMzJaOTNzZnV4dnZ2ZmFZaUgv?=
 =?utf-8?B?NUJ0WFAxRTV3K3lpWFR3U2d1RkRXam1haCtOZmNvZHRHeGVNRURBUytqdWh5?=
 =?utf-8?B?RXdDYkV0V0dYeXZ5L2ZxT0N3NmV2c2s1eFhOdi9ySU9LNVFxTHl6bHBDUFdT?=
 =?utf-8?B?dWFaR04wZjRIMGpFQlhPUC9DVi9NcHZEWDAyaTR2L2wzNm84SGFiWlFEY3Ba?=
 =?utf-8?B?dTd4WjFQYjZBYW14eVd6MUhZTkZMOTVpWXZZaFByU2tHN3JTSEcrYy9Kd1NO?=
 =?utf-8?B?MTNxOHB2amFjSC9ZWUUwR3l1VlF1UTIrQkZGWEwycWk2M3RBODljRmgxVy9L?=
 =?utf-8?B?b29qZGZETlZjT1JLb3FJU3F1UkFLeWRWYllnbjkyNDhQQVNReW9pZTJXbksw?=
 =?utf-8?B?MVNQMWY3cWJtVFdhcVVPWjZsaHdyendreElEZzVaNTJrQUIrS0tCTWRhaDho?=
 =?utf-8?B?U0RtZ3E1SGhxM1FFOHdnbUNzYmlOVDlycEdycHFJNWFqWWxhWkVqb2xMWGN1?=
 =?utf-8?B?ZWc1K3R3Q2dIck9lWG5lUklrMmQ4RUZDeDBaWDlHV3Y5d1BKdVVPcCt4UnJa?=
 =?utf-8?B?d1ZXaUJUaWJsSHFnaU52dHg1MndwTGpCdm8vTEFpY3ZWK0lzOEhUaHhRaXJt?=
 =?utf-8?B?cFQyclA0dDNBVFJSMEdyTlFzdG80eCtjSjdOUGRMdWxKVjAzNk9GOHRSZ05Q?=
 =?utf-8?B?SEpPbWpJdmU1bllzSmhpNThCeWlkM0c2cW1vbFNoSUhYMWhkdGxTS3QxYUh1?=
 =?utf-8?B?RXdJNlk3d0VVcmpURWd1WWRIWXd2b0xEYUM3cTN0b2hXN1hXVHRmWXYzRWlH?=
 =?utf-8?B?dUJ6U0VKUkMxOC9qSXI4MFB6VTJUdlMvTGhhajNsTnNBS2VvcHJ3emlyVEpD?=
 =?utf-8?B?M2ttdGJmaStBNVhEUWNqUzQwQkE1L0dLbXJmYmNyTUFDS3RQcnJ1RkxabUJz?=
 =?utf-8?B?ZFozU1M3NG42a3FjQUh4ZzdSMWdIMU1iaUVIdkFuanBQNTVpTkwyb1dtNCtK?=
 =?utf-8?B?a0Jic2tCVloxdkMvc3F2ODdyUE5kclFnMXBCQ20vR1ZxR2FTQzlZVDdqb2JQ?=
 =?utf-8?B?VjZqUWFrcytQVnBnK2Z1cHFSRU1KR3U4b3U2OXUyVDd1aklycDE5MVdUOTE4?=
 =?utf-8?B?UXZJT3JnSGNHb0FzS3dPdGZQcjdYZ05KN0R6UGRTbFJuOUVMQUVpSEg0V3h0?=
 =?utf-8?B?dGFuNlJNYkNML2x3ZWtoUnl3cHIwK282YnBPRGFRYTBqYXl4dCt0UWczQlk1?=
 =?utf-8?B?M1B4c3RGcExnZUZrRUFoTHJQdktTOTRoTFRWOTJSMVpkTDBWVnBmODNhdHUy?=
 =?utf-8?B?RzM1V0FVc2dqWnJIZmpQV2ROU2pTVFNPc1BBZFljdHljQkJsSzcxcDcwTDhF?=
 =?utf-8?B?VUkxekdPR0Q2V2ZlVFluNE1YK0hCa1JzcGRFbHZESm0wVUR5RzAzcGNYWVNr?=
 =?utf-8?B?SUtYM1RkbkZNT1hnKzVFUTJZRXpJaFR6OXB4bG40Y0NzV1BKc21aZzREemhK?=
 =?utf-8?B?L3Y4QW5sMVZWSDA0d0NiMC9HdkhxdHlKQStITTE1dElsSmlYL3lMV3R5bzhQ?=
 =?utf-8?B?bzdrcXkwNWZhVHNBUGI2YU5KRTVxamZvb29kRG90TUw3aDlqT1pObTg1eHVp?=
 =?utf-8?Q?qv8g+p9dfnKa+7WRsx6zIjWFIr09X5QTZNOMQE6//W1P1?=
X-MS-Exchange-AntiSpam-MessageData-1: ABUOo8UIug1vOw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05505326-84bd-4a9c-e04c-08dec110354e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 01:34:09.4604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9DUBTntRsEBWcOl/LT3ahvpH/x+ykKFqyC+Y6qbt93TChDSr0uw1hfVxszPbmTnxcxdj7OkLceDukNeKwN91pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6716

On Tue Jun 2, 2026 at 9:21 PM JST, Eliot Courtney wrote:
> On Tue Jun 2, 2026 at 12:21 PM JST, John Hubbard wrote:
>> FSP communication uses a pair of non-circular queues in the FSP
>> falcon's EMEM, one for messages from the driver to FSP and one for
>> replies, with the driver polling for response data. Add the queue
>> registers and the low-level helpers used by the higher-level FSP
>> message layer.
>>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/falcon/fsp.rs | 61 ++++++++++++++++++++++++++++-
>>  drivers/gpu/nova-core/regs.rs       | 21 ++++++++++
>>  2 files changed, 80 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core=
/falcon/fsp.rs
>> index 6b057d958115..0ec1c55213bc 100644
>> --- a/drivers/gpu/nova-core/falcon/fsp.rs
>> +++ b/drivers/gpu/nova-core/falcon/fsp.rs
>> @@ -112,7 +112,6 @@ impl Falcon<Fsp> {
>>      ///
>>      /// `data` is interpreted as little-endian 32-bit words. Returns `E=
INVAL`
>>      /// if `offset` or the `data` length is not 4-byte aligned.
>> -    #[expect(dead_code)]
>>      fn write_emem(&mut self, bar: &Bar0, offset: u32, data: &[u8]) -> R=
esult {
>>          if offset % 4 !=3D 0 || data.len() % 4 !=3D 0 {
>>              return Err(EINVAL);
>> @@ -131,7 +130,6 @@ fn write_emem(&mut self, bar: &Bar0, offset: u32, da=
ta: &[u8]) -> Result {
>>      ///
>>      /// `data` is stored as little-endian 32-bit words. Returns `EINVAL=
` if
>>      /// `offset` or the `data` length is not 4-byte aligned.
>> -    #[expect(dead_code)]
>>      fn read_emem(&mut self, bar: &Bar0, offset: u32, data: &mut [u8]) -=
> Result {
>>          if offset % 4 !=3D 0 || data.len() % 4 !=3D 0 {
>>              return Err(EINVAL);
>> @@ -145,4 +143,63 @@ fn read_emem(&mut self, bar: &Bar0, offset: u32, da=
ta: &mut [u8]) -> Result {
>> =20
>>          Ok(())
>>      }
>> +
>> +    /// Poll FSP for incoming data.
>> +    ///
>> +    /// Returns the size of available data in bytes, or 0 if no data is=
 available.
>> +    ///
>> +    /// The FSP message queue is not circular. Pointers are reset to 0 =
after each
>> +    /// message exchange, so `tail >=3D head` is always true when data =
is present.
>> +    #[expect(dead_code)]
>> +    pub(crate) fn poll_msgq(&self, bar: &Bar0) -> u32 {
>> +        let head =3D bar.read(regs::NV_PFSP_MSGQ_HEAD).address();
>> +        let tail =3D bar.read(regs::NV_PFSP_MSGQ_TAIL).address();
>> +
>> +        if head =3D=3D tail {
>> +            return 0;
>> +        }
>> +
>> +        // TAIL points at last DWORD written, so add 4 to get total siz=
e
>> +        tail.saturating_sub(head) + 4
>> +    }
>
> In a later patch, `send_sync_fsp` polls this then calls `recv_msg`. But,
> structurally it's possible to pass in any size to `recv_msg` and read
> more than we are supposed to. What about having `recv_msg` do the
> polling to get the size and return a KVec with the read out data,
> instead of `send_sync_fsp`? `poll_msgq` could stay private and we can
> make it public later if we need to.

The issue I see with returning a `KVec` is that it imposes a dynamic
allocation for every message. Granted, this is what the current code
does, but now that we have this `&mut self` logic in place that
guarantees exclusive access, we can also turn the receiving `KVec` into
a member of `Fsp` and keep passing it as a mut reference to avoid that.

>
>> +
>> +    /// Writes `packet` to FSP EMEM and updates the queue pointers to n=
otify FSP.
>> +    ///
>> +    /// Returns `EINVAL` if `packet` is empty or its length is not 4-by=
te aligned.
>> +    #[expect(dead_code)]
>> +    pub(crate) fn send_msg(&mut self, bar: &Bar0, packet: &[u8]) -> Res=
ult {
>> +        if packet.is_empty() {
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        // Write message to EMEM at offset 0 (validates 4-byte alignmen=
t)
>> +        self.write_emem(bar, 0, packet)?;
>> +
>> +        // Update queue pointers. TAIL points at the last DWORD written=
.
>> +        let tail_offset =3D u32::try_from(packet.len() - 4).map_err(|_|=
 EINVAL)?;
>> +        bar.write_reg(regs::NV_PFSP_QUEUE_TAIL::zeroed().with_address(t=
ail_offset));
>> +        bar.write_reg(regs::NV_PFSP_QUEUE_HEAD::zeroed().with_address(0=
));
>> +
>> +        Ok(())
>> +    }
>> +
>> +    /// Reads `size` bytes from FSP EMEM into `buffer` and resets the q=
ueue pointers.
>> +    ///
>> +    /// `size` comes from `poll_msgq`. Returns `EINVAL` if `size` is 0,=
 exceeds
>> +    /// `buffer`, or is not 4-byte aligned.
>> +    #[expect(dead_code)]
>> +    pub(crate) fn recv_msg(&mut self, bar: &Bar0, buffer: &mut [u8], si=
ze: usize) -> Result {
>> +        if size =3D=3D 0 || size > buffer.len() {
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        // Read response from EMEM at offset 0 (validates 4-byte alignm=
ent)
>> +        self.read_emem(bar, 0, &mut buffer[..size])?;
>> +
>> +        // Reset message queue pointers after reading
>> +        bar.write_reg(regs::NV_PFSP_MSGQ_TAIL::zeroed().with_address(0)=
);
>> +        bar.write_reg(regs::NV_PFSP_MSGQ_HEAD::zeroed().with_address(0)=
);
>> +
>> +        Ok(())
>> +    }
>
> I think we can remove the `size` argument and have the caller pass in
> an appropriately sized slice (altho obviated by my other comment).

Agreed, having both a slice and a length parameter is redundant and
requires extra checks that shouldn't be necessary. `recv_msg` is also
called right after we resized the receiving vector to the right size, so
we currently do have a call-time guarantee that `size =3D=3D buffer.len()`.
