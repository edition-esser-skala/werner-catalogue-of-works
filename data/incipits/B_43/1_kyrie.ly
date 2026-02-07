\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Allegro"
    r2 r16 f a d f d a'8
    g8.[\trill a16 f8.\trill g16] e8 a,,16\p cis e a, a'8
    g8.[\trill a16 f8.\trill g16] e a\f cis e a e \hA cis a
    r8 fis' r g r a r b~
    b a16 g a8 a gis a4 \hA gis8
    a16 c, e a c4 r16 b,! d g b4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Allegro"
    r2 r16 d f a d a f'8~
    f16 a, e'8~ e16 a, d8~ d cis r f,~\p
    f16 a, e'8~ e16 a, d8~ d cis e[\f a]
    r a r b r d r g~
    g fis16 e \hA fis8 f e c h e
    c16 a c e a4 r16 g, b d g4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    d'8.^\tutti d16 d8 cis d d r4
    r r8 d d cis r4
    r r8 f,\p e e r a\f
    a r b r d r b b~
    b a r d4( c8) h4\trill
    a r8 a b b r g
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son,
  e -- lei -- son,
  e -- lei -- son, e --
  lei -- _ son, e -- lei --
  son, e -- lei --
  son, e -- lei -- son, "e -"
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    f8.^\tutti f16 f8 e f f r4
    r r8 f e e r4
    r r8 d\p cis cis r e\f
    fis r g r a r g g~
    g fis r f e2
    e4 r8 fis g g r e
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son,
  e -- lei -- son,
  e -- lei -- son, e --
  lei -- _ son, e -- lei --
  son, e -- lei --
  son, e -- lei -- son, "e -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    a8.^\tutti a16 a8 a a a r4
    r r8 a a a r4
    r r8 a\p a a r cis\f
    d r d r d r d r
    d d r a gis a4 \hA gis8
    a4 r8 d d d r c
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son,
  e -- lei -- son,
  e -- lei -- son, e --
  lei -- _ son, e --
  lei -- son, e -- lei -- _ _
  son, e -- lei -- son, "e -"
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    d'8.^\tutti d16 d8 a f d r4
    r r8 d a' a, r4
    r r8 d\p a' a, r a\f
    d r g r fis r g r
    d4 r8 d e[ a] e4
    a, r8 d g g, r c
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son,
  e -- lei -- son,
  e -- lei -- son, e --
  lei -- _ _ _
  son, e -- lei -- _
  son, e -- lei -- son, "e -"
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Allegro"
    << { d'8. d16 d8 a } \\ { d,4-\tutti } >> f8 d r4
    r r8 d a' a, r4
    r r8 d a' a, r a
    d r g r fis r g r
    d4 r8 d e a e e,
    a4 r8 d g g, r c
  }
}

BassFigures = \figuremode {
  r4. <_+>8 r2
  r r8 <_+>4.
  r2 q4. q8
  q1
  <6 4>8 <5 _+>4 <_!>8 <7 _+>4 <4>8 <_+>
  r4. <_+>8 r4. <7>8
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
