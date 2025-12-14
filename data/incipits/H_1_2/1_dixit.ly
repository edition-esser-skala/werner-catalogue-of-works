\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "[no tempo]"
    r2 g''8 g g fis
    g g, g' g a a g4
    fis r8 a d4. cis8
    d16. a32 h16. c32 d8 fis, fis e e4~
    e8 cis fis4. e16 fis d4~
    d8 h e d16 e cis8 d4 \hA cis8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "[no tempo]"
    r2 h'8 d c h16 a
    h8 h, h' h cis d4 \hA cis8
    d4 r fis8 a g g
    fis fis4 d8 d cis r4
    cis4. a8 d4. \hA cis16 d
    h8 h r h e, fis e4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    r2 h'8^\tutti d c h16[ a]
    h8. h16 h4 cis8 d16 d d8[ \hA cis]
    d4 r d8 d d cis
    d d16 d d8 d16 d d8 cis e4~
    e8 cis fis4. e16 fis d4~
    d8 h e d16 e cis8 d d[ \hA cis]
  }
}

SopranoLyrics = \lyricmode {
  Di -- xit, di -- xit
  Do -- mi -- nus Do -- mi -- no me --
  o, di -- xit, di -- xit
  Do -- mi -- nus Do -- mi -- no me --  o: Se --
  de, se -- de a dex --
  tris, se -- de a dex -- tris "me -"
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    r2 g'8^\tutti g g fis
    g8. g16 g4 a8 a16 a g4
    fis r fis8 a g g
    fis fis16 fis fis8 fis16 fis fis8 e r4
    r a fis4. fis8
    g g r g g fis e4
  }
}

AltoLyrics = \lyricmode {
  Di -- xit, di -- xit
  Do -- mi -- nus Do -- mi -- no me --
  o, di -- xit, di -- xit
  Do -- mi -- nus Do -- mi -- no me -- o:
  Se -- de a
  dex -- tris, a dex -- tris "me -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    r2 d8^\tutti d e d
    d8. d16 d4 e8 a,16 a h8[ g]
    a4 r a8 a h a
    a a16 g fis[ g] a h a8 a r4
    cis4. a8 d4. cis16 d
    h8 h r h a a a4
  }
}

TenoreLyrics = \lyricmode {
  Di -- xit, di -- xit
  Do -- mi -- nus Do -- mi -- no me --
  o, di -- xit, di -- xit
  Do -- mi -- nus Do -- mi -- no me -- o:
  Se -- de, se -- de a
  dex -- tris a dex -- tris "me -"
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    r2 g'8^\tutti h a d,
    g8. g16 g4 g8 fis16 fis e4
    d r d8 fis e a,
    d fis16 e d[ e] fis g a8 a, r4
    a'4. fis8 h4. a16 h
    g8 g r e a d, a4
  }
}

BassoLyrics = \lyricmode {
  Di -- xit, di -- xit
  Do -- mi -- nus Do -- mi -- no me --
  o, di -- xit, di -- xit
  Do -- mi -- nus Do -- mi -- no me -- o:
  Se -- de, se -- de a
  dex -- tris,  a dex -- tris "me -"
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "[no tempo]"
    g'8-\tutti h a d, g h a d,
    g g, g'4. fis8 e4
    d8 fis e a, d fis e a,
    d fis16 e d e fis g a8 a, r4
    a'4. fis8 h4. a16 h
    g8 g, r e' a d, a4
  }
}

BassFigures = \figuremode {
  r8 <6> <7> q4 <6>8 <7> q
  r4 <3> <4\+ 2>8 <6> <7> <6\\>
  r4 <7>8 <_+>4. <7>8 <_+>
  r2 <4>8 <_+>4.
  <5>4 <6>2.
  r2 <_+>4 <4>8 <_+>
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vl"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolinoII
        }
      >>
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
